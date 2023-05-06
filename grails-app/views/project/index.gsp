<%@ page import="rms.Project" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#list-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="list-project" class="col-12 content scaffold-list" role="main">
                    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <table>
                        <thead>
                        <tr>
                            <g:sortableColumn property="name" title="Name" />
                            <g:sortableColumn property="alias" title="Alias" />
                            <g:sortableColumn property="description" title="Description" />
                            <g:sortableColumn property="isActive" title="Is Active" />
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${projectList as ArrayList<Project>}" var="project">
                            <tr>
                                <td>
                                    <g:link controller="project" action="show" id="${project.id}" class="no-underline">${project.name}</g:link>
                                </td>
                                <td>${project.alias}</td>
                                <td>${project.description}</td>
                                <td>${project.isActive ? "✅" : "❌"}</td>
                            </tr>
                        </g:each>
                        <!-- additional rows for each object in the "projectList" collection -->
                        </tbody>
                    </table>
                    <g:if test="${projectCount > params.int('max')}">
                    <div class="pagination">
                        <g:paginate total="${projectCount ?: 0}" />
                    </div>
                    </g:if>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>