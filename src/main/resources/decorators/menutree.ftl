<#macro tree menu>
    <#if menu.childMenus?? && menu.childMenus?size gt 0>
        <li class="treeview">
        <#else><li>
    </#if>
    <#if menu.funcurl??>
        <a id="${menu.id?default("")}" url="${menu.funcurl?default('#')}" target="${menu.target?default('mainFrame')}" href="javascript:;">
        <#else><a href="#">
    </#if>
       <#if menu.icon??>
           <i class="${menu.icon}"></i>
           <#else> <i class="fa fa-circle-o"></i>
       </#if>
       <span>${menu.name}</span>
        <#if  menu.childMenus?? && menu.childMenus?size gt 0>
            <i class="fa fa-angle-left pull-right"></i>
        </#if>
    </a>
    <#if  menu.childMenus?? && menu.childMenus?size gt 0>
        <ul class="treeview-menu">
            <#list menu.childMenus as child>
                <@tree menu=child />
            </#list>
        </ul>
    </#if>
</#macro>