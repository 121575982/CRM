<#include "header.ftl">
<body class="skin-blue-light sidebar-mini">
<div class="wrapper">
    <#include "top.ftl">
    <#include "left.ftl">
    <div id="main-content" class="content-wrapper" style="position:relative;top:0px;overflow: auto;">
        <#--<#include "fast-link.ftl">-->
    </div>
    <#--<#include "right.ftl">-->
</div>
<script type="text/javascript">

    function getIframeByElement(element){
        var iframe;
        $("iframe").each(function(){
            if(element.ownerDocument === this.contentWindow.document) {
                iframe = this;
            }
            return !iframe;
        });
        return iframe;
    }


    var tab={
        init : function(){
            $.fn.initJerichoTab({
                renderTo: '#main-content', uniqueId: 'jerichotab',
                contentCss: { 'height': $('#main-content').height() - 33 },
                tabs: [{
                    title: '首页',
                    closeable: false,
                    iconImg: '',
                    data: { dataType: 'iframe', dataLink: '/callMain' },
                    onLoadCompleted: function(h) {

                    }
                }], loadOnce: true, tabWidth: 110, titleHeight: 33
            });
        },
        resize: function(){
            $.fn.jerichoTab.resize();
        },
        add : function($this, refresh){
            var href = $this.attr('href');
//            var jerichotabindex = $this.attr('jerichotabindex');
//            if(typeof jerichotabindex != 'undefined'){
//                alert(jerichotabindex);
//            }else{
//                alert("-----------------------");
//            }
            if(href != "#"){
                $.fn.jerichoTab.addTab({
                    tabFirer: $this,
                    title: $this.find("span").text(),
                    closeable: true,
                    data: {
                        dataType: 'iframe',
//                        jerichotabindex:id,
                        dataLink: $this.attr('url')
                    }
                }).loadData(refresh);
            }
        },
        closeTab:function(iframeId, flag) {
            if (window.parent == window.self) {

                var cl=$(".tab_close>a", $("#jerichotab_" + iframeId));
               // alert(cl.attr("title"));


                $(".tab_close>a", $("#jerichotab_" + iframeId)).click();
                if (flag) {
                    $("#jerichotab_0").click();
                }
            } else {
                var iframe = $("#jerichotab_" + iframeId, parent.window.document)[0];
                $(".tab_close>a", $(iframe))[0].click();
                if (flag) {
                    $("#jerichotab_0", parent.window.document)[0].click();
                }
            }
        }
    };
    $().ready(function(){
        tab.init();
        tab.resize();
    })
    $(window).resize(function() {
        tab.resize();
    })

    //设置菜单点击事件
    $(".sidebar-menu li a").click(function (){
        tab.add($(this), true);
        tab.resize();
    })

    //打开菜单
    function openMenu(menuId){
        //alert(menuId);
        $(menuId).click();
    }


</script>
</body>
</html>
