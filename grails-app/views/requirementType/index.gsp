<%@ page import="rms.RequirementType" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'requirementType.label', default: 'RequirementType')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#list-requirementType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="list-requirementType" class="col-12 content scaffold-list" role="main">
                    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <table>
                        <thead>
                        <tr>
                            <g:sortableColumn property="name" title="Name" />
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${requirementTypeList as ArrayList<RequirementType>}" var="requirementType">
                            <tr>
                                <td>
                                    <g:link controller="requirementType" action="show" id="${requirementType.id}" class="no-underline">
                                        ${requirementType.name}
                                    </g:link>
                                </td>
                            </tr>
                        </g:each>
                        <!-- additional rows for each object in the "requirementTypeList" collection -->
                        </tbody>
                    </table>
                    <g:if test="${requirementTypeCount > params.int('max')}">
                    <div class="pagination">
                        <g:paginate total="${requirementTypeCount ?: 0}" />
                    </div>
                    </g:if>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>