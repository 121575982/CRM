$(function(){
    $(".panel-collapse").on("click", function () {
        var panel = $(this).parents(".panel").first();
        var body = panel.find(".panel-body");
        if (body.hasClass("in")) {
            body.removeClass("in");
            $(this).children(".fa-minus").removeClass("fa-minus").addClass("fa-plus");
        } else {
            body.addClass("in");
            $(this).children(".fa-plus").removeClass("fa-plus").addClass("fa-minus");

        }
    });

    $(".form-tree").css("cursor","pointer");
    $(".form-tree").css("background-color","#FFFFFF");

    $(".form-tree").on("click",function(){
        var group=$(this).parent(".input-group").first();
        var btn=group.find(".input-group-btn");
        if(btn.hasClass("open")){
            btn.removeClass("open");
        }else{
            btn.addClass("open");
        }
        return false;
    });
});
