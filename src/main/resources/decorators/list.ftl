<#include "header.ftl">
<body class='<sitemesh:write property="body.class"/>'>
    <div id="msgDiv">
        <#if message??>
            <div id="msgBox" class="alert alert-success">
        <#else >
            <div id="msgBox" class="alert alert-success hide">
        </#if>
            <a href="#" class="close" data-dismiss="alert" style="text-decoration: none;">
                x
            </a>
            <span id="msgContent">${message?default('')}</span>
        </div>
    </div>
    <sitemesh:write property="body"/>
</body>