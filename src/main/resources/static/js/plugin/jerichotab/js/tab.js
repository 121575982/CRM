define(function(require, exports, module){
   var $ = require('jerichotab');

    exports.init = function(){
        alert('init------------------');
        $.fn.initJerichoTab({
            renderTo: '#main-content', uniqueId: 'jerichotab',
            contentCss: { 'height': $('#workarea').height() - 33 },
            tabs: [{
                title: '首页',
                closeable: false,
                iconImg: '',
                data: { dataType: 'iframe', dataLink: '/callMain' },
                onLoadCompleted: function(h) {

                }
            }], loadOnce: true, tabWidth: 110, titleHeight: 33
        });
    };

    exports.add = function($this, refresh){
        var href = $this.attr('href');
        if(href != "#"){
            $.fn.jerichoTab.addTab({
                tabFirer: $this,
                title: $this.find("span").text(),
                closeable: true,
                data: {
                    dataType: 'iframe',
                    dataLink: $this.attr('url')
                }
            }).loadData(refresh);
        }
    };

    exports.resize = function(){
        $.fn.jerichoTab.resize();
    };

    /**
     *
     * @param iframeId
     * @param flag true: 关闭后到首页，false或undefined: 到被关闭页签的前一个页签
     */
    function closeTab (iframeId, flag) {
        if (window.parent == window.self) {
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

    exports.closeTab = closeTab;

        exports.addOne = function($this, refresh){
        var href = $this.attr('href');
        if(href != "#"){
            $.fn.jerichoTab.addTab({
                tabFirer: $this,
                title: $this.attr("name"),
                closeable: true,
                data: {
                    dataType: 'iframe',
                    dataLink: $this.attr('url')
                }
            }).loadData(refresh);
        }
    };
    exports.addnew = function($this, refresh){
        var href = $this.attr('href');
        if(href != "#"){
            $.fn.jerichoTab.addTab({
                tabFirer: $this,
                title: $this.attr("name"),
                closeable: true,
                data: {
                    dataType: 'iframe',
                    dataLink: $this.attr('url')
                }
            }).loadData(refresh);
        }
    };
});