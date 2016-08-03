<body >
<div class="col-md-12" id="play" style="height: 50px;">
</div>

<script type="application/javascript">
    $(function(){
        var playinfo;
        if (window.ActiveXObject || "ActiveXObject" in window){
            playinfo='<object id="player" height="64" width="100%" classid="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6">'
            +' <param name="autoStart" value="false"><param name="url" value="${recordFile?default("")}"></object>';

           var play= $("#play").html("<div></div>");
            play.append(playinfo);
        }
        else{
            playinfo='<audio   controls preload="none"  id="demo1" >'
            +' <source src="${recordFile?default("")}" ></audio>';
            var play= $("#play").html("<div></div>");
            play.append(playinfo);
            $( 'audio' ).audioPlayer();
        }


//
//
//       var id= window.parent.getIframeByElement(document.body).id;
//
//        alert(id);

    })

</script>


</body>