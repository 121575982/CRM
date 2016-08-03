define(function (require, exports, module) {
    var $ = require('jquery');
    var dialog = require('dialog');
    require('emotions');
    var main = require('main');
    require('tree');
    require('tree-exhide');
    require('./softphone/globalVariable');
    var softphone = require('softphone');
    var middleware = require('middleware');

    /**
     * 往客户列表增加客户
     * @param channel 来源渠道
     * @param custName 客户姓名
     * @param callId 会话ID
     */
    function addCust (channel, custName, callId) {
        var iClass = channel == "75007" ? "fa fa-weixin text-green" : "fa fa-link";
        custName = (custName == ''|| custName == null) ? "客户" : custName;
        var user = '<li id="cust_'+ callId +'" onclick="showChatPanel(\'cust_' + callId + '\')">' +
            '<a href="javascript:;"><i class="'+ iClass +'"></i> '+ custName + '</a></li>';
        $("#custList", $("#jerichotabiframe_0")[0].contentWindow.document).append(user);
    }

    exports.addCust = addCust;

    /**
     * 删除客户全部信息 (单条删除)
     * @param callId 会话id
     * @param flag 结束标识，cust-客户主动结束，agent-座席主动结束
     */
     function removeCust (callId, flag) {
        if(flag == "cust"){
            softphone.undateTelrecord(callId);
            softphone.saveChatRecord(1);
            // 从客户列表移除
            $("#cust_"+callId, $("#jerichotabiframe_0")[0].contentWindow.document).remove();
            // 删除客户信息
            delete custInfos[callId];
            // 删除消息列表
            delete msgs[callId];
            // 删除事中小结
            delete summarys[callId];
            if(currUser == callId){
                $(".direct-chat-messages", $("#jerichotabiframe_0")[0].contentWindow.document).empty();
            }
            // 将form中所有文本框内容清空
            $("input[id^='cust']", $("#jerichotabiframe_0")[0].contentWindow.document).val("");
        }else if(flag == "agent"){
            // 从客户列表移除
            $("#cust_" + callId, $("#jerichotabiframe_0")[0].contentWindow.document).removeAttr("id");
            // 删除客户信息
            delete window.parent.custInfos[callId];
            // 删除消息列表
            delete window.parent.msgs[callId];
            // 删除事中小结
            delete window.parent.summarys[callId];
            if(window.parent.currUser == callId){
                $(".direct-chat-messages").empty();
            }
            // 将form中所有文本框内容清空
            $("input[id^='cust']", $("#jerichotabiframe_0")[0].contentWindow.document).val("");
        }
    }

    exports.removeCust = removeCust;

    /**
     * 显示聊天面板
     * @param callId 会话id
     * @param destNo 内部通话目标柜员号
     */
    showChatPanel = function (id, destNo){
        if(!id && destNo){
            softphone.chatInternalCall(window.parent.current_agentId, destNo);
            return ;
        }
        var callId = id.split("_")[1];
        if(callId != window.parent.currUser){
            window.parent.currUser = callId;
            // 将原有小结保存
            if(null == window.parent.summarys[callId]){
                window.parent.summarys[callId] = [];
            }

            // 将被选中对象置为active
            $("li[id^='cust_'].active").removeClass("active");
            $("li[id^='agentmate_'].active").removeClass("active");
            $("#"+id).addClass("active");
            // 标题
            var flag;
            if("cust" == id.split("_")[0]){
                $("#boxTitle").text(window.parent.custInfos[callId].name == null ? "客户" : window.parent.custInfos[callId].name);
                flag = "cust";
            }else{
                var name = "座席";
                $.each(window.parent.agentMateArray, function (i, agent) {
                    if(agent.workno == destNo){
                        name = agent.name;
                    }
                });
                $("#boxTitle").text(name);
                flag = "agentmate";
            }
            // 去掉消息数目
            removeCustMsg(callId, flag);
            if(flag == "cust"){
                // 事中小结
                if(undefined != window.parent.summarys[callId] && "" != window.parent.summarys[callId]){
                    $("#summaryBtn").addClass("text-red");
                }else{
                    $("#summaryBtn").removeClass("text-red");
                }
                // 显示按钮
                $("#transferBtn").show();
                $("#interceptBtn").show();
                $("#phoneBtn").show();
                $("#closeBtn").show();
            }else if(flag == "agentmate"){
                // 隐藏按钮
                $("#transferBtn").hide();
                $("#interceptBtn").hide();
                $("#phoneBtn").hide();
                $("#closeBtn").hide();
            }
            // 清空聊天内容
            $(".direct-chat-messages").empty();
            // 将聊天内容初始化到聊天框中
            var chatMsgs = window.parent.oldMsgs[callId];
            if (chatMsgs != undefined && chatMsgs.length > 0) {
                if (window.parent.msgs[callId] != undefined) {
                    chatMsgs = chatMsgs.concat(window.parent.msgs[callId]);
                }
            } else {
                chatMsgs = window.parent.msgs[callId];
            }
            if (null != chatMsgs && chatMsgs.length > 0) {
                for (var i=0; i < chatMsgs.length; i++) {
                    var chatMsg = chatMsgs[i];
                    showMsgs(chatMsg, callId);
                }
            }
            // 将目前选中的取消勾选
            //window.parent.document.getElementById("summaryTree");
            var nodes = window.parent.summaryTree.getNodesByParam("checked", true);
            for(var i = 0; i < nodes.length; i++){
                nodes[i].checked = false;
                window.parent.summaryTree.updateNode(nodes[i]);
            }
            // 勾选当前客户的
            var sumItems = window.parent.summarys[callId];
            var sumArray;
            if(undefined != sumItems && "" != sumItems){
                sumArray = sumItems.split(",");
                for(var i=0; i<sumArray.length; i++) {
                    if(sumArray[i] != undefined && sumArray[i] != ""){
                        var node = window.parent.summaryTree.getNodeByParam("id", sumArray[i]);
                        window.parent.summaryTree.checkNode(node, true, true);
                        //window.parent.summaryTree.selectNode(node, false);
                    }
                }
            }
            // 显示服务历史
            showServiceHis(window.parent.custInfos[callId].custNo);
        }

        if (flag == "cust") {
            // 显示客户信息
            showCustInfos("jerichotabiframe_0");
        }
    }

    /**
     * 显示客户信息
     */
    function showCustInfos (iframeId) {
        main.log("显示客户信息");
        // 将form中所有文本框内容清空
        $("input[id^='cust']").val("");
        // 重新赋值
        if(iframeId){
            main.fillForm("custInfoForm", window.parent.custInfos[window.parent.currUser], iframeId);
            var channel = window.parent.custInfos[window.parent.currUser].channel;
            if (channel){
                $.get("/dictionary/getByKey?key=common_telrecord_channel&subKey="+channel, function (data) {
                    $("#custChannel").val(data.value);
                });
            }
            var sex = window.parent.custInfos[window.parent.currUser].sex;
            if (sex){
                $.get("/dictionary/getByKey?key=common_sex&subKey="+sex, function (data) {
                    $("#custSex").val(data.value);
                });
            }
        }else{
            main.fillForm("custInfoForm", custInfos[currUser]);
            var channel = custInfos[currUser].channel;
            if (channel) {
                $.get("/dictionary/getByKey?key=common_telrecord_channel&subKey="+channel, function (data) {
                    $("#custChannel" ,$("#jerichotabiframe_0")[0].contentWindow.document).val(data.value);
                });
            }
            var sex = custInfos[currUser].sex;
            if (sex){
                $.get("/dictionary/getByKey?key=common_sex&subKey="+sex, function (data) {
                    $("#custSex" ,$("#jerichotabiframe_0")[0].contentWindow.document).val(data.value);
                });
            }
        }
    }

    exports.showCustInfos = showCustInfos;

    /**
     * 显示服务历史
     */
    function showServiceHis(custNo) {
        main.log("显示服务历史 custNo = " + custNo);
        seajs.use("table", function($) {
            $('#his-grid').bootstrapTable('refresh', {
                url : "/telrecord/queryCustom?customno=" + custNo
            });
        });
    }

    exports.showServiceHis = showServiceHis;

    /**
     * 改变未读消息数目
     * @param callId 会话ID
     * @param num 数目
     * @param flag  cust-客户，agentmate-其他座席
     */
    function addMsgNum (callId, num, flag) {
        var spanObj = $("#"+ flag + "_" + callId, $("#jerichotabiframe_0")[0].contentWindow.document).find("a").find("span");
        if(spanObj.length > 0){
            var chatNum =parseInt(spanObj.text()) ? parseInt(spanObj.text()) : 0;
            spanObj.text(chatNum + num);
        }else if(spanObj.length == 0 && num > 0){
            $("#" + flag + "_" + callId, $("#jerichotabiframe_0")[0].contentWindow.document).find("a").append('<span class="label label-danger pull-right">'+ num +'</span>');
        }
    }

    exports.addMsgNum = addMsgNum;

    /**
     * 移除未读消息数目
     * @param callId 会话ID
     * @param flag  cust-客户，agentmate-其他座席
     */
    function removeCustMsg (callId, flag) {
        $("#"+ flag + "_" + callId).find("a").find("span").remove();
    }

    exports.removeCustMsg = removeCustMsg;

    /**
     * 刷新座席列表
     */
    function refreshAgentList() {
        main.log("刷新座席列表开始");
        if(window.parent.global_agentPhoneNum == undefined || window.parent.global_agentPhoneNum == ""){
            return ;
        }
        // 文字座席技能组
        var skillArray = [];
        main.log("获取所有技能组  开始");
        $.get('/dictSelect?key=chat_skill', function (data) {
            $.each(data, function (i, channel) {
                skillArray.push(channel.id)
            });

            var tempAgentArray = new Array();
            if(skillArray.length == 0){
                return ;
            }
            addSpin("agentBox");
            $.each(skillArray, function (i, skillId) {
                var agentArray = softphone.agentIdsBySkillId(window.parent.current_agentId, skillId);
                if(undefined != agentArray && agentArray.length > 0) {
                    tempAgentArray = tempAgentArray.concat(agentArray);
                }
            });
            main.log("座席队列去重");
            // 去重
            var result = [], hash = {};
            hash[window.parent.current_agentId] = true;
            for(var i = 0; i< tempAgentArray.length; i++){
                if (undefined == tempAgentArray[i]) {
                    return;
                }
                var elem = tempAgentArray[i].workno;
                if(!hash[elem]){
                    var agentJson = {"workno": tempAgentArray[i].workno, "name": tempAgentArray[i].name, "status": tempAgentArray[i].status};
                    result.push(agentJson);
                    hash[elem] = true;
                }
            }
            tempAgentArray = result;
            // 和现在的座席列表对比
            if(window.parent.agentMateArray.length == 0){
                $.each(tempAgentArray, function (i, agent) {
                    addAgentMate(agent.workno, agent.name, agent.status);
                });
            }else{
                var midArray = [];
                if (window.parent.agentMateArray != undefined && window.parent.agentMateArray.length > 0) {
                    midArray = window.parent.agentMateArray;
                }
                for(var i = 0; i < tempAgentArray.length; i++) {
                    // 判断是否存在的标识
                    var flag = false;
                    for(var j = 0; j < window.parent.agentMateArray.length; j++){
                        flag = false;
                        // 工号已存在的查看是否需要更新状态
                        if(tempAgentArray[i].workno == window.parent.agentMateArray[j].workno){
                            // 操作标识 0-不处理，1-更新， 2-新增
                            var opt = tempAgentArray[i].status == window.parent.agentMateArray[j].status ? 0 : 1;
                            flag = true;
                            midArray[j].opt = opt;
                            break;
                        }
                    }
                    if(!flag){
                        var agentElem = tempAgentArray[i];
                        agentElem.opt = 2;
                        midArray.push(agentElem);
                    }
                }
                $.each(midArray, function (i, agent) {
                    if(undefined != agent.opt){
                        if(agent.opt == 1){         // 更新状态

                        }else if(agent.opt == 2){   // 新增
                            addAgentMate(agent.workno, agent.name, agent.status);
                        }
                    }else{      // 删除
                        removeAgentMate(agent.workno);
                    }
                });
            }
            window.parent.agentMateArray = tempAgentArray;
            removeSpin("agentBox");
            main.log("座席队列刷新成功！");
            getCustNumOfAgent();
        });
    }

    exports.refreshAgentList = refreshAgentList;

    /**
     * 获取座席的接线人数
     */
    function getCustNumOfAgent () {
        var num = 0;
        var limitNum = 6;
        $.ajax({
            url : "/getMaxNum",
            type: "get",
            async : false,
            dataType : "json",
            success : function (data) {
                limitNum = data.maxNum;
            },
            error : function () {
                main.log("获取座席最大接线量失败 ！");
            }
        });
        $.each(window.parent.agentMateArray, function (i, agent) {
            num = softphone.getCustNum(agent.workno);
            main.log("获取座席的接线人数： 座席号：" + agent.workno + ", 接线人数：" + num);
            if($("li[workno=" + agent.workno + "]").find("a").find("span").length != 0){
                //$("li[workno=" + agent.workno + "]").find("a").find("span").text();
                $("li[workno=" + agent.workno + "]").find("a").find("span").text(" | "+num + "/" + limitNum);
            }else{
                $("li[workno=" + agent.workno + "]").find("a").append("<span> | "+num + "/" + limitNum + "</span>");
            }
        });
    }

    /**
     * 座席列表增加座席
     * @param agentNo 座席工号
     * @param name 座席姓名
     * @param status 座席状态
     */
    function addAgentMate(agentNo, name, status) {
        var agent = '<li name="agentmate" workno="' + agentNo + '" status="' + status + '" onclick="showChatPanel(this.id, \''+ agentNo +'\')">' +
            '<a href="javascript:void(0);">' +
            name + '('+agentNo+')</a></li>';
        if($("#agentList").attr("class") != undefined){
            $("#agentList").append(agent);
        }else{
            $("#agentList", $("#jerichotabiframe_0")[0].contentWindow.document).append(agent);
        }
    }

    exports.addAgentMate = addAgentMate;

    /**
     * 座席列表移除座席
     * @param agentWorkNo 座席工号
     */
    function removeAgentMate(agentWorkNo) {
        if($("li[workno=" + agentWorkNo + "]").attr("id")){
            var callId = $("li[workno=" + agentWorkNo + "]").attr("id").split("_")[1];
            // 删除客户信息
            delete window.parent.custInfos[callId];
            // 删除消息列表
            delete window.parent.msgs[callId];
        }
        // 从客户列表移除
        $("li[workno=" + agentWorkNo + "]").remove();
    }

    exports.removeAgentMate = removeAgentMate;

    /**
     * 收到消息触发事件
     * @param msg 消息内容
     */
    function onReceiveMsg(msg) {
        var callId = msg.content.callId;
        // 收到的消息为当前会话客户/座席发送的消息
        var chatContent = JSON.parse(msg.content.chatContent);
        var msgType = chatContent.msgType;
        var msgContent = $.replaceEmotion(chatContent.msgContent);
        var flag = msg.content.isInnerCall == true ? "agentmate" : "cust";

        if(null == callId && undefined == callId){
            return;
        }
        var msgCss = chatContent.msgCss;

        // 当前用户直接显示消息，非当前用户增加消息数目
        if(currUser == callId){
            var msg = {};
            msg.content = msgContent;
            msg.from = flag;
            msg.msgType = msgType;
            msg.time = main.getNowDateTime();
            if(msgCss != 'null' && msgCss != null && msgCss != '') {
                msg.msgCss = msgCss;
            }
            showMsgs(msg, callId, "jerichotabiframe_0", msgCss);
        }else{
            addMsgNum(callId, 1, flag);
        }
        var chatMsg = {"from":"cust", "msgType":msgType, "content":msgContent, "time":main.getNowDateTime(), "msgCss" : msgCss};
        // 将收到的消息加入消息队列
        if(null == msgs[callId]){
            msgs[callId] = [];
        }
        msgs[callId].push(chatMsg);
    }

    exports.onReceiveMsg = onReceiveMsg;

    /**
     * 发送文本消息
     */
    function sendTextMsg() {
        if(undefined == window.parent.currUser || null == window.parent.currUser || "" == window.parent.currUser){
            return ;
        }
        if(null == window.parent.msgs[window.parent.currUser]){
            window.parent.msgs[window.parent.currUser] = [];
        }
        $("#chatTextSendBtn", parent.document).click();
    }

    exports.sendTextMsg = sendTextMsg;

    /**
     *  发送图片消息
     * @param path 图片路径
     */
    function sendImgMsg(path) {
        $("#chatImgSendBtn", parent.document).click();
    }

    exports.sendImgMsg = sendImgMsg;

    /**
     * 显示消息
     * @param msg 收到/发送的消息
     * @param callId 呼叫Id
     * @param iframeId
     * @param fontCss
     */
     function showMsgs (msg, callId, iframeId, msgCss) {
        var msgType = msg.msgType;
        var content = msg.content;
        var time = msg.time;
        var from = msg.from;
        if(msgCss == null || msgCss == 'null') {
            msgCss = '';
        }else {
            msgCss = JSON.parse(msgCss);
        }
        if(content == "" || content == null){
            return;
        }
        if("img" == msgType) {
            content = '<img class="img-thumbnail chat-message-img" src="/img/upload/'+content+'" ondblclick="showBigPic(this.src)">';
        } else if("opt" == msgType) {
            if(content == "phone") {
                showTips("客户请求开放webcall权限", callId, 1);
                return;
            } else {
                showTips(content, callId, 1);
                return ;
            }
        }
        var msgDiv;
        if(from == "cust" || from == "agentmate"){
            msgDiv = '<div class="direct-chat-msg"><div class="direct-chat-info clearfix">' +
                '<span class="direct-chat-timestamp pull-right">' + time + '</span></div>' +
                '<img class="direct-chat-img" src="img/cust.jpg" alt="message user image"><div class="direct-chat-text"></div></div>';
        }else if(from == "agent" || from == "robot"){
            var imgSrc = from == "agent" ? "img/agent.jpg" : "img/robot.png";
            msgDiv = '<div class="direct-chat-msg right"><div class="direct-chat-info clearfix">' +
                '<span class="direct-chat-timestamp pull-left">' + time + '</span></div>' +
                '<img class="direct-chat-img" src="' + imgSrc + '" alt="message user image"><div class="direct-chat-text"></div></div>';
        }else if(from == "sys"){
            msgDiv = '<div class="tip">' + content + '</div>';
        }
        if(iframeId){
            $(".direct-chat-messages", $("#"+iframeId)[0].contentWindow.document).append(msgDiv);
            if(from != "sys"){
                if(msgCss != ''){
                    $(".direct-chat-messages", $("#"+iframeId)[0].contentWindow.document)
                        .find(".direct-chat-msg:last").find(".direct-chat-text").css(msgCss);
                }
                $(".direct-chat-messages", $("#"+iframeId)[0].contentWindow.document).find(".direct-chat-msg:last").find(".direct-chat-text").html(content);
                $(".direct-chat-messages", $("#jerichotabiframe_0")[0].contentWindow.document)
                    .scrollTop($(".direct-chat-messages", $("#jerichotabiframe_0")[0].contentWindow.document)[0].scrollHeight + 200);
            }
        }else{
            $(".direct-chat-messages").append(msgDiv);
            if(from != "sys"){
                if(msgCss != ''){
                    $(".direct-chat-messages").find(".direct-chat-msg:last").find(".direct-chat-text").css(msgCss);
                }
                $(".direct-chat-messages").find(".direct-chat-msg:last").find(".direct-chat-text").html(content);
                $(".direct-chat-messages").scrollTop($(".direct-chat-messages")[0].scrollHeight + 200);
            }
        }
    }

    exports.showMsgs = showMsgs;

    /**
     * 修改字体
     */
    function changeFontFamily () {
        var fontFamily = $("#fontFamily").val();
        $("#chatBox").css("font-family", fontFamily);
        window.parent.fontFamily = fontFamily;
    }

    exports.changeFontFamily = changeFontFamily;

    /**
     * 修改字号
     */
    function changeFontSize() {
        var fontSize = $("#fontSize").val();
        $("#chatBox").css("font-size", fontSize+"px");
        window.parent.fontSize = fontSize;
    }

    exports.changeFontSize = changeFontSize;

    /**
     * 修改颜色
     */
    function changeFontColor(fontColor) {
        $("#chatBox").css("color", fontColor);
        window.parent.fontColor = fontColor;
    }

    exports.changeFontColor = changeFontColor;

    function setFontCss (content) {
        if(fontFamily){
            content.fontFamily = fontFamily;
        }
        if(fontSize){
            content.fontSize = fontSize;
        }
        if(fontColor){
            content.fontColor = fontColor;
        }
    }

    exports.setFontCss = setFontCss;

    /**
     * 只获取当前时间
     * @returns {string}
     */
    function getNowTime() {
        var date = new Date();
        return date.toLocaleTimeString();
    }

    exports.getNowTime = getNowTime;

    /**
     * 申请拦截
     */
    function interceptCust() {
        dialog.show({
            title: "申请拦截",
            draggable: true,
            message: $('<textarea class="form-control" placeholder="请填写拦截原因"></textarea>'),
            buttons: [{
                label: "取消",
                cssClass: "btn-default",
                action: function(dialogRef){
                    dialogRef.close();
                }
            }, {
                label: "确定",
                cssClass: "btn-success",
                hotkey: 13,
                action: function(dialogRef){
                    var reason = dialogRef.getModalBody().find("textarea").val();
                    if($.trim(reason) == null || $.trim(reason) == ""){
                        dialog.alert("请输入拦截原因！");
                        return false;
                    }
                    if(main.getStrLength(reason) > 200){
                        dialog.alert("拦截原因不要超过200个字！");
                        return false;
                    }
                    var custId = window.parent.custInfos[window.parent.currUser].custNo;
                    var custName = window.parent.custInfos[window.parent.currUser].name;
                    var data = {"callId": window.parent.currUser, "custId": custId, "cause": reason, "custName": custName}
                    main.log("提交申请拦截");
                    $.post("/blacklist/save", data, function (resultData) {
                        if(resultData.result >= 0){
                            main.log("提交申请拦截成功");
                            dialogRef.close();
                        }else{
                            dialog.alert("申请拦截提交失败！");
                        }
                    });
                }
            }]
        });
    }

    exports.interceptCust = interceptCust;

    /**
     *  结束会话(座席主动结束会话)
     */
    function endChat () {
        dialog.show({
            title: "提示",
            draggable: true,
            message: "确定终止当前会话吗？",
            buttons:[{
                label: "取消",
                cssClass: "btn-default",
                action: function(dialogRef){
                    dialogRef.close();
                }
            },{
            label: "确定",
                cssClass: "btn-success",
                hotkey: 13,
                action: function(dialogRef){
                    // 调用华为终止会话接口
                    $("#endBtn", parent.document).click();
                    showTips("当前会话已结束。", window.parent.currUser, 0);
                    custNum--;
                    dialogRef.close();
                    softphone.undateTelrecord(window.parent.currUser);
                    setTimeout(removeCust(window.parent.currUser, "agent"), 5000);
                }
            }]
        });
    }

    exports.endChat = endChat;

    /**
     * 会话结束（客户主动结束，转接成功也会收到该事件）
     */
    function disconnectChat(event) {
        main.log("客户主动结束会话 ！");
        var callId = event.content.callId;
        if(main.indexOfArray(transfers, callId) > -1){
            main.removeFromArray(transfers, callId);
        }
        showTips("当前会话已结束。", event.content.callId, 1);

        softphone.saveChatRecord();
        custNum--;
        if(custNum == 0){
            setTimeout(softphone.removeAllCust(), 10*1000);
        }else{
            removeCust(event.content.callId, "cust");
            if(currUser == event.content.callId){
                $(".direct-chat-messages").empty();
            }
        }
        softphone.undateTelrecord(callId);
    }

    exports.disconnectChat = disconnectChat;

    /**
     * 转接客户
     */
    function transferCust() {
        dialog.show({
            title: "转接",
            message: $('<input id="destNo" align="center" class="form-control" placeholder="请输入被转接座席工号" maxlength="10"> '),
            draggable: true,
            buttons: [{
                label: '关闭',
                cssClass: 'btn-default',
                action: function (dialogItself) {
                    dialogItself.close();
                }
            }, {
                label: '确定',
                cssClass: 'btn-primary',
                hotkey: 13,
                action: function (dialogItself) {
                    var destNo = dialogItself.getModalBody().find("input").val();
                    if("" == $.trim(destNo) || null == $.trim(destNo)){
                        dialog.alert("请输入被转接座席工号！");
                        return false;
                    }
                    // 保存聊天记录
                    softphone.saveChatRecord(1);
                    $("#transferBtn", parent.document).attr("destno", destNo).click();
                    window.parent.transfers.push(window.parent.currUser);
                    showTips("已发出转接申请，请稍后...", window.parent.currUser, 0);
                    dialogItself.close();
                }
            }]
        });
    }

    exports.transferCust = transferCust;

    /**
     * 转接失败后调用事件
     * @param callId 呼叫ID
     */
    function transferFailed(callId) {
        main.log("转接失败 ！");
        var custName = custInfos[callId].name ? "客户" : custInfos[callId].name;
        main.removeFromArray(transfers, callId);
        dialog.show({
            title: "提示",
            message: custName + "转接失败！",
            buttons: [{
                label: '关闭',
                cssClass: 'btn-primary',
                action: function (dialogItself) {
                    dialogItself.close();
                }
            }]
        });
    }

    exports.transferFailed = transferFailed;

    /**
     * 会话开始转接事件，到该事件时会话已经转接成功
     */
    function transferStart(event){
        main.log("转接成功 ！");
        showTips("转接成功", event.content.callId, 1);
        // 5秒后将该客户从客户列表移除
        setTimeout(function () {
            removeCust(event.content.callId, "cust");
            // 清屏
            if(currUser == event.content.callId){
                $(".direct-chat-messages").empty();
            }
        }, 5000);
    }

    exports.transferStart = transferStart;

    /**
     * 文字交谈失效通知
     */
    function chatSwaped() {
        dialog.show({
            title: "提示",
            message: "由于服务器切换，您当前的所有会话失效！",
            buttons: [{
                label: '关闭',
                cssClass: 'btn-primary',
                action: function (dialogItself) {
                    dialogItself.close();
                }
            }]
        });
    }

    exports.chatSwaped = chatSwaped;

    /**
     * 会话建立连接
     * @param event
     */
    function chatConnected(event) {
        main.log("会话建立连接");
        var isInnerCall = event.content.isInnerCall;
        var callId = event.content.callId;
        // 随路数据
        var attachData = event.content.attachData;
        // 转接标识
        var isTransfered = !(attachData.indexOf("|") > -1);
        if(custNum == 0){
            main.log("custNum = " + custNum + "内部呼叫标识 ：" + isInnerCall);
            // 是否内部呼叫
            if (isInnerCall) {
                if(current_agentId != event.content.caller){
                    setTimeout(function () {
                        newCommingAgent(event.content);
                    }, 3000);
                }
                setTimeout(function () {
                    // 只有一个会话时直接弹出
                    var agentWorkNo = current_agentId == event.content.caller ? event.content.called : event.content.caller;
                    $("li[name='agentmate'][workno='"+agentWorkNo+"']", $("#jerichotabiframe_0")[0].contentWindow.document).attr("id", "agentmate_"+ callId);
                    $("#agentList", $("#jerichotabiframe_0")[0].contentWindow.document).find("li[workno='"+agentWorkNo +"']").click();
                }, 4000);
            } else {
                var channel = event.content.called;
                var name;
                main.log("是否转接，结果 ： " + isTransfered);
                if(isTransfered){
                    attachData = JSON.parse(attachData);
                    var custInfo = attachData.custInfo;
                    custInfo.channel = channel;
                    custInfos[callId] = custInfo;
                    name = custInfo.name;
                    var workNo = attachData.workNo;
                    main.log("获取和前一个座席的聊天记录  开始");
                    // 获取之前的聊天记录
                    $.ajax({
                        url : "/record/query?callId=" + callId + "&dealoper=" + workNo,
                        type : "get",
                        async : false,
                        success : function (recordList) {
                            $.each(recordList, function (i, record) {
                                var chatMsg = {
                                    "from": record.talkBy,
                                    "msgType": record.chatType,
                                    "content":record.content,
                                    "time": record.createTime
                                }
                                if(!oldMsgs[callId]){
                                    oldMsgs[callId] = [];
                                }
                                oldMsgs[callId].push(chatMsg);
                                main.log("获取和前一个座席的聊天记录  结束");
                            });
                        },
                        error : function () {
                            main.log("获取和前一个座席的聊天记录  失败");
                        }
                    });
                } else {
                    main.log("设置客户信息  开始");
                    setCustInfos(callId, channel, attachData);
                    main.log("设置客户信息  结束");
                    name = custInfos[callId].name;
                    // 获取和机器人的聊天记录
                    var userId = custInfos[callId].custNo;
                    var startTime = main.getlongDate(main.getNowDateTime().substr(0, 11) + "00:00:00");
                    var endTime = main.getlongDate(main.getNowDateTime());
                    main.log("获取和机器人的聊天记录  开始");
                    getRobotMsg(userId, startTime, endTime, callId);
                    main.log("获取和机器人的聊天记录  结束");
                }
                setTimeout(function () {
                    addCust(channel, name, callId);
                    $("#cust_" + callId, $("#jerichotabiframe_0")[0].contentWindow.document).click();
                }, 3000);
                // 保存基础会话
                main.log("保存会话基础信息  开始");
                saveBasicRecord(callId);
                main.log("保存会话基础信息  结束");
            }
        }else{
            // 是否内部呼叫
            if(isInnerCall){
                newCommingAgent(event.content);
                setTimeout(function () {
                    // 只有一个会话时直接弹出
                    var agentWorkNo = current_agentId == event.content.caller ? event.content.called : event.content.caller;
                    $("li[name='agentmate'][workno='"+agentWorkNo+"']", $("#jerichotabiframe_0")[0].contentWindow.document).attr("id", "agentmate_"+ callId);
                    $("#agentList", $("#jerichotabiframe_0")[0].contentWindow.document).find("li[workno='"+agentWorkNo +"']").click();
                }, 1000);
            }else{
                var channel = event.content.called;
                var name;
                main.log("是否转接 isTransfered = " + isTransfered);
                if(isTransfered){
                    attachData = JSON.parse(attachData);
                    var custInfo = attachData.custInfo;
                    custInfo.channel = channel;
                    custInfos[callId] = custInfo;
                    name = custInfo.name;
                    var workNo = attachData.workNo;
                    // 获取之前的聊天记录
                    main.log("获取和前一个座席的聊天记录  开始");
                    $.ajax({
                        url : "/record/query?callId=" + callId + "&dealoper=" + workNo,
                        type : "get",
                        async : false,
                        success : function (recordList) {
                            $.each(recordList, function (i, record) {
                                var chatMsg = {
                                    "from": record.talkBy,
                                    "msgType": record.chatType,
                                    "content":record.content,
                                    "time": record.createTime
                                }
                                if(!oldMsgs[callId]){
                                    oldMsgs[callId] = [];
                                }
                                oldMsgs[callId].push(chatMsg);
                                main.log("获取和前一个座席的聊天记录  结束");
                            });
                        },
                        error : function () {
                            main.log("获取和前一个座席的聊天记录  失败");
                        }
                    });
                } else {
                    main.log("设置客户信息  开始");
                    setCustInfos(callId, channel, attachData);
                    main.log("设置客户信息  结束");
                    // 获取和机器人的聊天记录
                    var userId = custInfos[callId].custNo;
                    var startTime = main.getlongDate(main.getNowDateTime().substr(0, 11) + "00:00:00");
                    var endTime = new Date().getTime();
                    main.log("获取和机器人的聊天记录  开始");
                    getRobotMsg(userId, startTime, endTime, callId);
                    main.log("获取和机器人的聊天记录  结束");
                    name = custInfos[callId].name;
                }
                main.log("客户列表增加客户  开始");
                addCust(channel, name, callId);
                main.log("客户列表增加客户  结束");
                // 保存基础会话
                main.log("保存基础会话信息  开始");
                saveBasicRecord(callId);
                main.log("保存基础会话信息  结束");
            }
        }
        custNum ++;
    }

    exports.chatConnected = chatConnected;

    function getRobotMsg (userId, startTime, endTime, callId) {
        main.log("获取和机器人聊天记录  ...");
        $.get("/record/queryRobot?userId="+userId+"&startTime="+startTime+"&endTime="+endTime+"&flag=1",
            function (robotRecordList) {
                main.log("获取和机器人聊天记录成功，记录条数 = " + robotRecordList.length);
                $.each(robotRecordList, function (i, record) {
                    var msg = {};
                    msg.from = record.talkBy;
                    msg.content = record.content;
                    msg.msgType = record.chatType;
                    msg.time = record.createTime;
                    if(oldMsgs[callId] == undefined){
                        oldMsgs[callId] = [];
                    }
                    oldMsgs[callId].push(msg);
                });
            });
    }

    /**
     * 从座席列表中获取座席姓名和状态
     * @param agentWorkNo 坐席号
     */
    function getAgentNameAndStatus(agentWorkNo) {
        $.each(agentMateArray, function (i, agent) {
            if(agentWorkNo == agent.workno){
                return agent.name + "|" + agent.status;
            }
        });
    }

    exports.getAgentNameAndStatus = getAgentNameAndStatus;

    /**
     * 一通新的内部通话到达时的操作
     * @param content 消息内容
     */
    function newCommingAgent(content) {
        var agentId = current_agentId;
        if(!current_agentId){
            agentId = window.parent.current_agentId;
        }
        var agentWorkNo = agentId == content.caller ? content.called : content.caller;
        var nameAndStatus = getAgentNameAndStatus(agentWorkNo);
        if(!nameAndStatus){
            refreshAgentList();
        }
    }

    exports.newCommingAgent = newCommingAgent;

    /**
     * 客户进线后记录客户信息
     * @param callId 呼叫Id
     * @param channel 进线渠道
     * @param attachData 随路数据
     */
    function setCustInfos(callId, channel, attachData) {
        var custInfosArray = attachData.split("|");
        var custName = channel == "75007" ? custInfosArray[10] : custInfosArray[9];
        var custInfo = {"channel": custInfosArray[24], "busType" : custInfosArray[1]};
        // 匿名客户
        if(custInfosArray[7] == "0"){
            if(custInfosArray[2] != "null"){
                custInfo.custNo = custInfosArray[2];
            }
            if(custInfosArray[9] != "null"){
                custInfo.name = custInfosArray[9];
            }
            if(custInfosArray[0] != "null"){
                custInfo.custLevel = custInfosArray[0];
            }
            if(custInfosArray[17] != "null"){
                custInfo.branch = custInfosArray[17];
            }
            if(custInfosArray[11] != "null"){
                custInfo.mobile = custInfosArray[11];
            }
            if(custInfosArray[12] != "null"){
                custInfo.phone = custInfosArray[12];
            }
            if(custInfosArray[13] != "null"){
                custInfo.email = custInfosArray[13];
            }
            if(custInfosArray[16] != "null"){
                custInfo.companyName = custInfosArray[16];
            }
            if(custInfosArray[22] != "null"){
                custInfo.ip = custInfosArray[22];
            }
            if(custInfosArray[23] != "null"){
                custInfo.mac = custInfosArray[23];
            }
            if(custInfosArray[14] != "null"){
                custInfo.custType = custInfosArray[14];
            }
            if(custInfosArray[5] != "null"){
                custInfo.ctfType = custInfosArray[5];
            }
            if(custInfosArray[4] != "null"){
                custInfo.ctfNo = custInfosArray[4];
            }
        } else {
            // 对私
            if(custInfosArray[6] == "0"){
                var queryType = custInfosArray[3] == "null" ? "2" : "1";
                var param;
                if(queryType == "1"){
                    var accNo = custInfosArray[3] == "null" ? "" : custInfosArray[3];
                    custInfo.account = accNo;
                    param = "queryType=1&accNo=" + accNo + "&ctfType=&ctfNo=&cstName=";
                }else if (queryType == "2"){
                    var ctfType = custInfosArray[5];
                    var ctfNo = custInfosArray[4];
                    var cstName = custInfosArray[9];
                    custInfo.ctfType = ctfType;
                    custInfo.ctfNo = ctfNo;
                    param = "queryType=2&accNo=&ctfType="+ctfType+"&ctfNo="+ctfNo+"&cstName=" + cstName;
                }
                main.log("获取对私客户信息  开始");
                $.ajax({
                    url : "/telrecord/queryPrivateCust?" + param,
                    type : "get",
                    async : false,
                    success : function (cust) {
                        main.log("获取对私客户信息  成功");
                        if (cust != null && cust != "") {
                            custInfo.custNo = cust.coreCstNo;
                            custInfo.name = cust.cstName;
                            custInfo.sex = cust.sex;
                            custInfo.mobile = cust.mobile;
                            custInfo.phone = cust.homePhone;
                            custInfo.companyName = cust.cropName;
                        }
                    }
                });
                if(custInfosArray[22] != "null"){
                    custInfo.ip = custInfosArray[17];
                }
                if(custInfosArray[23] != "null"){
                    custInfo.mac = custInfosArray[18];
                }
            } else if(custInfosArray[6] == "1") {
                var ctfType = custInfosArray[5];
                var ctfNo = custInfosArray[4];
                if(ctfType == "null" || ctfNo == "null"){
                    main.log("对公客户信息带入有误！");
                    return;
                }
                var param = "ctfType=" + ctfType + "&ctfNo=" + ctfNo;
                main.log("获取对公客户信息  开始");
                $.ajax({
                    url : "/telrecord/queryCompanyCust?" + param,
                    type : "get",
                    async : false,
                    success : function (cust) {
                        main.log("获取对公客户信息  成功");
                        if(cust != null && cust != ""){
                            custInfo.name = cust.userNm;
                            custInfo.mobile = cust.mobile;
                            custInfo.sex = cust.sex;
                            custInfo.custNo = cust.cbCstNo;
                            custInfo.companyName = cust.cstNmCn;
                            custInfo.custLevel = cust.cstGrade;
                            custInfo.ctfType = cust.ctfType;
                            custInfo.ctfNo = cust.ctfNo;
                            if(custInfosArray[22] != "null") {
                                custInfo.ip = custInfosArray[22];
                            }
                            if(custInfosArray[23] != "null") {
                                custInfo.mac = custInfosArray[23];
                            }
                        }
                    }
                });
            }
        }
        custInfos[callId] = custInfo;
    }

    exports.setCustInfos = setCustInfos;

    /**
     * 开放webcall功能
     */
    function unlimitPhone() {
        dialog.show({
            title: "提示",
            message: "确定为该客户开放webcall权限吗？",
            buttons: [{
                label: '关闭',
                cssClass: 'btn-default',
                action: function (dialogItself) {
                    dialogItself.close();
                }
            },{
                label: '确定',
                cssClass: 'btn-primary',
                action: function (dialogItself) {
                    $("#phoneBtn", parent.document).click();
                    showTips("已向对方开放webcall功能。", window.parent.currUser, 0);
                    dialogItself.close();
                }
            }]
        });
    }

    exports.unlimitPhone = unlimitPhone;

    /**
     * 增加刷新图标操作
     * @param id
     */
    addSpin = function (id) {
        $("#"+id).append('<div id="spin" class="overlay"><i class="fa fa-refresh fa-spin"></i></div>');
    }

    exports.addSpin = addSpin;

    /**
     * 移除刷新图标操作
     * @param id
     */
    removeSpin = function (id) {
        $('#'+id).find("#spin").remove();
    }

    exports.removeSpin = removeSpin;

    /**
     * 显示提示信息
     * @param tipContent
     * @param callId
     * @param flag 0-内部调用（不输入默认为内部调用），1-外部调用
     */
    function showTips(tipContent, callId, flag) {
        flag = flag ? flag : 0;
        if(flag == 0){
            if(!callId){
                callId = window.parent.currUser;
            }
            if(callId == window.parent.currUser){
                var tip = '<div class="tip">' + tipContent + '</div>';
                $(".direct-chat-messages").append(tip);
                $(".direct-chat-messages").scrollTop($(".direct-chat-messages")[0].scrollHeight + 200);
            }
            var msg = {"from":"sys", "msgType":"text", "content":tipContent, "time":main.getNowDateTime()};
            if(!window.parent.msgs[callId]){
                window.parent.msgs[callId] = [];
            }
            window.parent.msgs[callId].push(msg);
        }else if(flag == 1){
            if(!callId){
                callId = currUser;
            }
            if(callId == currUser){
                var tip = '<div class="tip">' + tipContent + '</div>';
                $(".direct-chat-messages", $("#jerichotabiframe_0")[0].contentWindow.document).append(tip);
                $(".direct-chat-messages", $("#jerichotabiframe_0")[0].contentWindow.document)
                    .scrollTop($(".direct-chat-messages", $("#jerichotabiframe_0")[0].contentWindow.document)[0].scrollHeight + 200);
            }
            var msg = {"from":"sys", "msgType":"text", "content":tipContent, "time":main.getNowDateTime()};
            if(!msgs[callId]){
                msgs[callId] = [];
            }
            msgs[callId].push(msg);
        }
    }

    exports.showTips = showTips;

    /**
     * 保存会话基础记录
     * @param callId
     */
    function saveBasicRecord(callId) {
        var custInfo = custInfos[callId];
        var tbCommonTelrecord = {
            "callid": callId,
            "dealoper" : current_agentId,
            "extenno": global_agentPhoneNum,
            "calltype": "0",
            "custname": custInfo.name,
            "customno": custInfo.custNo,
            "mobile": custInfo.mobile,
            "hometel": custInfo.phone,
            "chatcustno": custInfo.custNo,
            "channel": custInfo.channel,
            "custommac": custInfo.mac,
            "customip": custInfo.ip,
            "email": custInfo.email,
            "branchbank": custInfo.branch,
            "sysflag": "HAGM"
        }
        main.log("保存会话基础信息 ...")
        $.post("/telrecord/add", tbCommonTelrecord, function (data) {
            if(data.result == -1){
                alert("basic record save error!");
            }
        });
    }

    exports.saveBasicRecord = saveBasicRecord;

    /**
     * 发起内部通话失败调用事件
     */
    function chatCallOutFailed(){
        dialog.alert("发起内部通话失败");
    }

    exports.chatCallOutFailed = chatCallOutFailed;

    /**
     * 查询等待人数
     * @returns {*}
     */
    function getWaitCustNum() {
        return softphone.getWaitNum();
    }

    exports.getWaitCustNum = getWaitCustNum;

});