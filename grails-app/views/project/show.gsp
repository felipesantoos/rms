<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#show-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="show-project" class="col-12 content scaffold-show" role="main">
                    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <ol class="property-list project">
                        <li class="fieldcontain">
                            <span id="name-label" class="property-label">Name</span>
                            <div class="property-value" aria-labelledby="name-label">${this.project.name}</div>
                        </li>
                        <li class="fieldcontain">
                            <span id="alias-label" class="property-label">Alias</span>
                            <div class="property-value" aria-labelledby="alias-label">${this.project.alias}</div>
                        </li>
                        <li class="fieldcontain">
                            <span id="description-label" class="property-label">Description</span>
                            <div class="property-value" aria-labelledby="description-label">${this.project.description}</div>
                        </li>
                        <li class="fieldcontain">
                            <span id="isActive-label" class="property-label">Is Active</span>
                            <div class="property-value" aria-labelledby="isActive-label">${this.project.isActive ? "✅" : "❌"}</div>
                        </li>
                    </ol>
                    <g:form resource="${this.project}" method="DELETE">
                        <fieldset class="buttons">
                            <g:link class="edit" action="edit" resource="${this.project}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                            <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                        </fieldset>
                    </g:form>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>
