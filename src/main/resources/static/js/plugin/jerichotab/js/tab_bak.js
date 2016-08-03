   var tab= {
       init : function () {
           alert('-----init');
           $.fn.initJerichoTab({
               renderTo: '#main-content', uniqueId: 'jerichotab',
               contentCss: {'height': $('#workarea').height() - 33},
               tabs: [{
                   title: '首页',
                   closeable: false,
                   iconImg: '',
                   data: {dataType: 'iframe', dataLink: '/callMain'},
                   onLoadCompleted: function (h) {

                   }
               }], loadOnce: true, tabWidth: 110, titleHeight: 33
           });
       },

   resize : function () {
       $.fn.jerichoTab.resize();
   }
   };