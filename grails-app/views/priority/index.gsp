<%@ page import="rms.Priority" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'priority.label', default: 'Priority')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#list-priority" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="list-priority" class="col-12 content scaffold-list" role="main">
                    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <table>
                        <thead>
                        <tr>
                            <g:sortableColumn property="level" title="Level" />
                            <g:sortableColumn property="color" title="Color" />
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${priorityList as ArrayList<Priority>}" var="priority">
                            <tr>
                                <td>
                                    <g:link controller="priority" action="show" id="${priority.id}" class="no-underline">
                                        ${priority.level}
                                    </g:link>
                                </td>
                                <td>
                                    <span style="background: ${priority.color}; display: inline-block; border-radius: 2px; padding: 0 4px;">
                                        ${priority.color}
                                    </span>
                                </td>
                                <td>
                                    <g:link class="no-underline" controller="priority" action="edit" resource="${priority}">✏️</g:link>
                                    <g:link class="no-underline" controller="priority" action="delete" resource="${priority}">🗑️</g:link>
                                </td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>

                    <g:if test="${priorityCount > params.int('max')}">
                    <div class="pagination">
                        <g:paginate total="${priorityCount ?: 0}" />
                    </div>
                    </g:if>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>