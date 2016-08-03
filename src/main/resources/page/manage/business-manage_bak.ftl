<body>
    <SCRIPT type="text/javascript">
        <!--
        // 树形结构的数据在这里是写死的，实际应用中，是从数据库中读出的，存在request对象中，
        // 然后用request.getAttribute()方法，从一个变量中读出来，
        // 实际应用中应该是：var zNodes = <%=request.getAttribute("data")%> ，是从request中动态读出来的，
        // 关于如何拼接生成这种JSON嵌套格式的字符串，可以参考《附录一：多叉树结合JavaScript树形控件实现
        // 无限级树形结构（一种构建多级有序树形结构JSON（或XML）数据源的方法）》，
        // 《附录一》是专门介绍如何生成JSON嵌套格式的数据，
        // 注：下面的这个zNodes数据格式，我是在原有zTree标准数据格式的基础上扩展了一些属性，凡是以ex_开头
        // 的属性都是我扩展增加的，标准数据格式中没有，这些额外增加的属性，zTree是
        // 不会解析的，是我用来实现『按节点选择次数排序』和『搜索』功能时用到的，后台Java程序在构造数据时，
        // 需要构造成下面这个样子。
        //
        // （注：扩展属性的含义：
        // ex_uid：节点编号
        // ex_pid：父节点编号
        // ex_weight：节点选择次数（权值）
        // ex_visible：节点可见性
        // ex_parentNode：父节点引用）

        var zNodes = [
            {
                name: '北京市',
                ex_uid: '0',
                ex_pid: '',
                ex_weight: 0,
                ex_visible: true,
                ex_parentNode: null,
                children: [
                    {
                        name: '顺义区',
                        ex_uid: '2',
                        ex_pid: '0',
                        ex_weight: 0,
                        ex_visible: true,
                        ex_parentNode: null,
                        children: [
                            {
                                name: '杨镇',
                                ex_uid: '3',
                                ex_pid: '2',
                                ex_weight: 0,
                                ex_visible: true,
                                ex_parentNode: null,
                                children: [
                                    {
                                        name: '李各庄村',
                                        ex_uid: '4',
                                        ex_pid: '3',
                                        ex_weight: 0,
                                        ex_visible: true,
                                        ex_parentNode: null
                                    },
                                    {
                                        name: '一街村',
                                        ex_uid: '5',
                                        ex_pid: '3',
                                        ex_weight: 0,
                                        ex_visible: true,
                                        ex_parentNode: null
                                    },
                                    {
                                        name: '二郎庙村',
                                        ex_uid: '6',
                                        ex_pid: '3',
                                        ex_weight: 0,
                                        ex_visible: true,
                                        ex_parentNode: null
                                    }
                                ]
                            },
                            {
                                name: '木林镇',
                                ex_uid: '7',
                                ex_pid: '2',
                                ex_weight: 0,
                                ex_visible: true,
                                ex_parentNode: null,
                                children: [
                                    {
                                        name: '荣各庄村',
                                        ex_uid: '8',
                                        ex_pid: '7',
                                        ex_weight: 0,
                                        ex_visible: true,
                                        ex_parentNode: null
                                    }
                                ]
                            },
                            {
                                name: '龙湾屯镇',
                                ex_uid: '9',
                                ex_pid: '2',
                                ex_weight: 0,
                                ex_visible: true,
                                ex_parentNode: null,
                                children: [
                                    {
                                        name: '王泮庄村',
                                        ex_uid: '15',
                                        ex_pid: '9',
                                        ex_weight: 0,
                                        ex_visible: true,
                                        ex_parentNode: null
                                    }
                                ]
                            },
                            {
                                name: '李遂镇',
                                ex_uid: '10',
                                ex_pid: '2',
                                ex_weight: 0,
                                ex_visible: true,
                                ex_parentNode: null,
                                children: [
                                    {
                                        name: '柳各庄村',
                                        ex_uid: '14',
                                        ex_pid: '10',
                                        ex_weight: 0,
                                        ex_visible: true,
                                        ex_parentNode: null
                                    }
                                ]
                            }
                        ]
                    },
                    {
                        name: '平谷区',
                        ex_uid: '11',
                        ex_pid: '0',
                        ex_weight: 0,
                        ex_visible: true,
                        ex_parentNode: null,
                        children: [
                            {
                                name: '夏各庄镇',
                                ex_uid: '12',
                                ex_pid: '11',
                                ex_weight: 0,
                                ex_visible: true,
                                ex_parentNode: null,
                                children: [
                                    {
                                        name: '马各庄村',
                                        ex_uid: '13',
                                        ex_pid: '12',
                                        ex_weight: 0,
                                        ex_visible: true,
                                        ex_parentNode: null
                                    }
                                ]
                            }
                        ]
                    }
                ]
            }
        ];

        var setting = {
            callback: {
                onClick: clickNode
            }
        };

        // 单击节点后触发的事件，
        // 在这个方法里，做两件事：
        //
        // 1、增加节点所在路径的权值（也叫做『路径向上加权』），这里的『路径向上加权』使用的方法与
        // 《附录二：新概念『智能树形菜单』--利用加权多叉树结合JavaScript树形控件实现》中的路径加权方法不一样，这是由于在JavaScript中无法建立
        // 像Java中的那种带有双向引用的多叉树结构（即父节点引用子节点，子节点引用父节点），在JavaScript中如果做这种双向引用的话，会造成
        // 『Stack overflow』异常，所以只能分别建立两棵多叉树对象，一棵是原始树形结构对象，另一棵是利用nodeMap建立的多叉树对象，专门用于
        // 反向引用，即子节点对父节点的引用。而在Java中，直接可以根据一个节点的父节点引用，找到它所有的父节点。但是在这里，只能采用一种笨
        // 办法，先从反向引用的多叉树中找到某一节点的所有父节点，存在一个数组里，然后在原始树形结构对象中使用先序遍历方法，从顶向下依次查找，
        // 把某一节点的所有父节点的权值加1，效率较低，但与利用反向引用查找父节点的方法目的是一样的。
        //
        // 2、更新节点选择次数到数据库中，以备下次登录系统时恢复原数据
        function clickNode(event, treeId, treeNode, clickFlag) {
            var parentNodes = [];
            var currentNode = nodeMap['_' + treeNode.ex_uid];
            var parentNode = currentNode.ex_parentNode;
            while (parentNode != null) {
                parentNodes.push(parentNode);
                parentNode = parentNode.ex_parentNode;
            }
            parentNodes.push(currentNode);
            increaseNodesWeight(zNodes[0], parentNodes);

            // 更新节点选择次数到数据库中，以备下次登录系统时恢复原数据
            modifyNodeWeigthToDB();
        }

        // 更新节点选择次数到数据库中，
        // 由于没有数据库，所以暂时不实现这个方法，实际应用时需要实现该方法
        function modifyNodeWeigthToDB() {
            // todo
        }

        // 增加节点所在路径的权值
        function increaseNodesWeight(node, parentNodes) {
            if (containNode(node, parentNodes)) {
                node.ex_weight++;
            }
            if (node.children && node.children.length != 0) {
                var i = 0;
                for (; i < node.children.length; i++) {
                    if (containNode(node, parentNodes)) {
                        increaseNodesWeight((node.children)[i], parentNodes);
                    }
                }
                // 如果在本层节点中没有找到要增加权值的节点，说明需要增加权值的节点都已经找完了，
                // 不需要再向下一层节点中寻找了，直接退出递归函数
                if (i == node.children.length - 1) {
                    return;
                }
            }
        }

        // 排序方法：按照节点选择次数排序【冒泡法排序】
        // 节点选择次数大的排在前面，如果次数相等，按照编号排，编号小的排在前面
        function bubbleSortByWeight(theArray) {
            var temp;
            for (var i = 0; i < theArray.length-1; i++) {
                for (var j = theArray.length - 1; j > i ; j--) {
                    if (theArray[j].ex_weight > theArray[j - 1].ex_weight) {
                        temp = theArray[j];
                        theArray[j] = theArray[j - 1];
                        theArray[j - 1] = temp;
                    } else if (theArray[j].ex_weight == theArray[j - 1].ex_weight) {
                        if (theArray[j].ex_uid < theArray[j - 1].ex_uid) {
                            temp = theArray[j];
                            theArray[j] = theArray[j - 1];
                            theArray[j - 1] = temp;
                        }
                    }
                }
            }
        }

        // 排序方法：按照节点编号排序，编号小的排在前面【冒泡法排序】
        function bubbleSortByUid(theArray) {
            var temp;
            for (var i = 0; i < theArray.length-1; i++) {
                for (var j = theArray.length - 1; j > i ; j--) {
                    if (theArray[j].ex_uid < theArray[j - 1].ex_uid) {
                        temp = theArray[j];
                        theArray[j] = theArray[j - 1];
                        theArray[j - 1] = temp;
                    }
                }
            }
        }

        // 按照节点选择次数对树形结构进行兄弟节点排序【递归排序】
        function orderSiblingsByWeight(node) {
            if (node.children && node.children.length != 0) {
                bubbleSortByWeight(node.children);
                for (var i = 0; i < node.children.length; i++) {
                    orderSiblingsByWeight((node.children)[i]);
                }
            }
        }

        // 按照节点编号对树形结构进行兄弟节点排序【递归排序】
        function orderSiblingsByUid(node) {
            if (node.children && node.children.length != 0) {
                bubbleSortByUid(node.children);
                for (var i = 0; i < node.children.length; i++) {
                    orderSiblingsByUid((node.children)[i]);
                }
            }
        }

        // 设置树节点为“不可见”状态【先序遍历法】
        function setTreeNotVisible(root) {
            root.ex_visible = false;
            if (root.children && root.children.length != 0) {
                for (var i = 0; i < root.children.length; i++) {
                    setTreeNotVisible((root.children)[i]);
                }
            }
        }

        // 设置树节点为“可见”状态【先序遍历法】
        function setTreeVisible(root) {
            root.ex_visible = true;
            if (root.children && root.children.length != 0) {
                for (var i = 0; i < root.children.length; i++) {
                    setTreeVisible((root.children)[i]);
                }
            }
        }

        // 设置当前节点及其所有上级节点为“可见”状态
        function setRouteVisible(root, node, nodeMap) {
            node.ex_visible = true;
            var parentNodes = [];
            var currentNode = nodeMap['_' + node.ex_uid];
            var parentNode = currentNode.ex_parentNode;
            while (parentNode != null) {
                parentNodes.push(parentNode);
                parentNode = parentNode.ex_parentNode;
            }
            // 如果没有上级节点，说明当前节点就是根节点，直接返回即可
            if (parentNodes.length == 0) {
                return;
            }
            setParentNodesVisible(root, parentNodes);
        }

        // 设置所有上级节点为“可见”，
        // 这里的『设置上级节点为“可见”』使用的方法与《附录二：新概念『智能树形菜单』--利用加权多叉树结合JavaScript树形控件实现》
        // 中的『设置功能路径可见』方法不一样，这是由于在JavaScript中无法建立像Java中的那种带有双向引用的多叉树结构（即父节点
        // 引用子节点，子节点引用父节点），在JavaScript中如果做这种双向引用的话，会造成『Stack overflow』异常，所以只能分别建立
        // 两棵多叉树对象，一棵是原始树形结构对象，另一棵是利用nodeMap建立的多叉树对象，专门用于反向引用，即子节点对父节点的引用。
        // 而在Java中，直接可以根据一个节点的父节点引用，找到它所有的父节点。但是在这里，只能采用一种笨办法，先从反向引用的多叉树
        // 中找到某一节点的所有父节点，存在一个数组里，然后在原始树形结构对象中使用先序遍历方法，从顶向下依次查找，把某一节点的所有
        // 父节点设置为可见，效率较低，但与利用反向引用查找父节点的方法目的是一样的。
        function setParentNodesVisible(node, parentNodes) {
            if (containNode(node, parentNodes)) {
                node.ex_visible = true;
            }
            if (node.children && node.children.length != 0) {
                var i = 0;
                for (; i < node.children.length; i++) {
                    if (containNode(node, parentNodes)) {
                        setParentNodesVisible((node.children)[i], parentNodes);
                    }
                }
                // 如果在本层节点中没有找到要设置“可见性”的节点，说明需要设置“可见性”的节点都已经找完了，不需要再向下一层节点中寻找了，
                // 直接退出递归函数
                if (i == node.children.length - 1) {
                    return;
                }
            }
        }

        // 检查数组中是否包含与指定节点编号相同的节点
        function containNode(node, parentNodes) {
            for (var i = 0; i < parentNodes.length; i++) {
                if (parentNodes[i].ex_uid == node.ex_uid) {
                    return true;
                }
            }
            return false;
        }

        // 搜索包含关键字的树节点，将包含关键字的节点所在路径设置为“可见”，例如：如果某一节点包含搜索关键字，
        // 那么它的所有上级节点和所有下级节点都设置为“可见”【先序遍历法】
        function searchTreeNode(root1, root2, nodeMap, keyWord) {
            if (root2.name.indexOf(keyWord) > -1) {
                setTreeVisible(root2);
                setRouteVisible(root1, root2, nodeMap);
            } else {
                if (root2.children && root2.children.length != 0) {
                    for (var i = 0; i < root2.children.length; i++) {
                        searchTreeNode(root1, (root2.children)[i], nodeMap, keyWord);
                    }
                }
            }
        }

        // 将原树形结构数据复制出一个副本，以备对副本进行搜索过滤，而不破坏原始数据（原始数据用来恢复原状用）【先序遍历法】
        function cloneTreeNodes(root) {
            var treeJSON = '{' + 'name : \'' + root.name + '\', ex_uid : \'' + root.ex_uid + '\',' + 'ex_pid : \'' + root.ex_pid + '\',' + ' ex_weight : ' + root.ex_weight + ', ex_visible : true, ex_parentNode : null';
            if (root.children && root.children.length != 0) {
                treeJSON += ', children : [';
                for (var i = 0; i < root.children.length; i++) {
                    treeJSON += cloneTreeNodes((root.children)[i]) + ',';
                }
                treeJSON = treeJSON.substring(0, treeJSON.length - 1);
                treeJSON += "]";
            }
            return treeJSON + '}';
        }

        // 构造节点映射表【先序遍历法】
        // 这里特殊说明一下：
        // 构造节点映射表的目的，是为了下面建立子节点对父节点的引用，这是一个中间步骤，但是有个小问题：
        // 在javascript中，如果是在原树状对象上建立子节点对父节点的引用，会发生『Stack overflow』错误，
        // 我估计是由于循环引用造成的，因为原树状对象已经存在父节点对子节点的引用，此时再建立子节点对
        // 父节点的引用，造成循环引用，这在Java中是没有问题的，但是在JavaScript中却有问题，所以为了避免
        // 这个问题，我创建了一批新的节点，这些节点的内容和原树状结构节点内容一致，但是没有children属性，
        // 也就是没有父节点对子节点的引用，然后对这批新节点建立子节点对父节点的引用关系，这个方法会被buildParentRef()方法调用，来完成这个目的。
        function buildNodeMap(node, nodeMap) {
            var newObj = new Object();
            newObj.name = node.name;
            newObj.ex_uid = node.ex_uid;
            newObj.ex_pid = node.ex_pid;
            newObj.ex_weight = node.ex_weight;
            newObj.ex_visible = node.ex_visible;
            nodeMap['_' + node.ex_uid] = newObj;
            if (node.children && node.children.length != 0) {
                for (var i = 0; i < node.children.length; i++) {
                    buildNodeMap((node.children)[i], nodeMap);
                }
            }
            return nodeMap; // 这里需要将nodeMap返回去，然后传给buildParentRef()函数使用，这和Java中的引用传递不一样，怪异！！
        }

        // 建立子节点对父节点的引用
        function buildParentRef(node, nodeMap) {
            for (ex_uid in nodeMap) {
                if ((nodeMap[ex_uid]).ex_pid == '') {
                    (nodeMap[ex_uid]).ex_parentNode = null;
                } else {
                    (nodeMap[ex_uid]).ex_parentNode = nodeMap['_' + (nodeMap[ex_uid]).ex_pid];
                }
            }
            return nodeMap;
        }

        // 对树形结构数据进行搜索过滤后，根据JavaScript树状对象，重新生成JSON字符串【先序遍历法】
        function reBuildTreeJSON(node) {
            if (node.ex_visible) {
                var treeJSON = '{' + 'name : \'' + node.name + '\', ex_uid : \'' + node.ex_uid + '\',' + 'ex_pid : \'' + node.ex_pid + '\',' + ' ex_weight : ' + node.ex_weight + ', ex_visible : ' + node.ex_visible + ', ex_parentNode : null';
                if (node.children && node.children.length != 0) {
                    treeJSON += ', children : [';
                    for (var i = 0; i < node.children.length; i++) {
                        if ((node.children)[i].ex_visible) {
                            treeJSON += reBuildTreeJSON((node.children)[i]) + ',';
                        } else {
                            treeJSON += reBuildTreeJSON((node.children)[i]);
                        }
                    }
                    treeJSON = treeJSON.substring(0, treeJSON.length - 1);
                    treeJSON += "]";
                }
                return treeJSON + '}';
            } else {
                return '';
            }
        }

        // 树形结构搜索
        function searchTreeNodesByKeyWord() {
            // 声明一个新的树对象
            var newZNodes = null;
            // 将原树形结构恢复默认状态
            orderSiblingsByUid(zNodes[0]);
            // 将原树对象复制出一个副本，并将这个副本JSON字符串转换成新的树对象
            var treeJSON = cloneTreeNodes(zNodes[0]);
            newZNodes = eval('(' + '[' + treeJSON + ']' + ')');

            var root = newZNodes[0];
            // 对新树对象建立反向引用关系（在子节点中增加父节点的引用）
            var nodeMap = {};
            // 构造节点映射表（下面借助该映射表建立反向引用关系）
            nodeMap = buildNodeMap(root, nodeMap);
            // 建立子节点对父节点的引用
            nodeMap = buildParentRef(root, nodeMap);
            // 设置树节点为“不可见”状态
            setTreeNotVisible(root);
            // 搜索包含关键字的树节点，将包含关键字的节点所在路径设置为“可见”，例如：如果某一节点包含搜索关键字，
            // 那么它的所有上级节点和所有下级节点都设置为“可见”
            searchTreeNode(root, root, nodeMap, document.getElementById('search').value);
            // 对树形结构数据进行搜索过滤后，根据JavaScript树状对象，重新生成JSON字符串
            treeJSON = reBuildTreeJSON(root);
            newZNodes = eval('(' + '[' + treeJSON + ']' + ')');

            $.fn.zTree.init($("#treeDemo"), setting, newZNodes);
            $.fn.zTree.getZTreeObj("treeDemo").expandAll(true);
        }

        // 按照节点选择次数排序（按选择次数排序）
        function orderByWeight() {
            orderSiblingsByWeight(zNodes[0]);
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
            $.fn.zTree.getZTreeObj("treeDemo").expandAll(true);
            document.getElementById('search').value = '';
        }

        // 按照节点编号排序（恢复默认状态）
        function orderByUid() {
            orderSiblingsByUid(zNodes[0]);
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
            $.fn.zTree.getZTreeObj("treeDemo").expandAll(true);
            document.getElementById('search').value = '';
        }

        //============建立原始树状对象节点的反向引用关系，即子节点对父节点的引用=============//
        //============单击树节点，进行路径向上加权时会用到===================================//
        // 这里的nodeMap是全局变量，和searchTreeNodesByKeyWord()方法中的nodeMap变量作用域不一样
        var nodeMap = {};
        // 构造节点映射表（下面借助该映射表建立反向引用关系）
        nodeMap = buildNodeMap(zNodes[0], nodeMap);
        // 建立子节点对父节点的引用
        buildParentRef(zNodes[0], nodeMap);
        //===============================================================================//

        // 初始化该树形结构，默认展开所有节点
        $(document).ready(function(){
            orderSiblingsByUid(zNodes[0]);
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
            $.fn.zTree.getZTreeObj("treeDemo").expandAll(true);
        });

        //-->
    </SCRIPT>
<div class="content_wrap">
    <div class="zTreeDemoBackground left">
        <ul class="info">
            <li style="padding-bottom:8px">&nbsp;&nbsp;&nbsp;&nbsp;<input value="按选择次数排序" type="button" onclick="orderByWeight()" />&nbsp;&nbsp;<input value="恢复默认" type="button" onclick="orderByUid()" /> </li>
            <li>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="" size="16" id="search">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input value="搜索" type="button" onclick="searchTreeNodesByKeyWord()" /> </li>
        </ul>
        <ul id="treeDemo" class="ztree"></ul>
    </div>
</div>


</body>