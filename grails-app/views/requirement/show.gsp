<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'requirement.label', default: 'Requirement')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#show-requirement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="show-requirement" class="col-12 content scaffold-show" role="main">
                    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <ol class="property-list requirement">
                        <li class="fieldcontain">
                            <span id="code-label" class="property-label">Code</span>
                            <div class="property-value" aria-labelledby="code-label">${this.requirement.code}</div>
                        </li>
                        <li class="fieldcontain">
                            <span id="title-label" class="property-label">Title</span>
                            <div class="property-value" aria-labelledby="title-label">${this.requirement.title}</div>
                        </li>
                        <li class="fieldcontain">
                            <span id="description-label" class="property-label">Description</span>
                            <div class="property-value" aria-labelledby="description-label">${this.requirement.description}</div>
                        </li>
                        <li class="fieldcontain">
                            <span id="userStory-label" class="property-label">User Story</span>
                            <div class="property-value" aria-labelledby="userStory-label">${this.requirement.userStory}</div>
                        </li>
                        <li class="fieldcontain">
                            <span id="type-label" class="property-label">Type</span>
                            <div class="property-value" aria-labelledby="type-label">
                                <g:link class="no-underline" controller="requirementType" action="show" id="${this.requirement?.type?.id}">
                                    ${this.requirement?.type?.name}
                                </g:link>
                            </div>
                        </li>
                        <li class="fieldcontain">
                            <span id="origin-label" class="property-label">Origin</span>
                            <div class="property-value" aria-labelledby="origin-label">
                                <g:link class="no-underline" controller="requirementOrigin" action="show" id="${this.requirement?.origin?.id}">
                                    ${this.requirement?.origin?.name}
                                </g:link>
                            </div>
                        </li>
                        <li class="fieldcontain">
                            <span id="priority-label" class="property-label">Priority</span>
                            <div class="property-value" aria-labelledby="priority-label">
                                <g:link class="no-underline" controller="priority" action="show" id="${this.requirement?.priority?.id}">
                                    <span style="background: ${this.requirement.priority?.color}; display: inline-block; border-radius: 2px; padding: 0 4px;">
                                        ${this.requirement?.priority?.level}
                                    </span>
                                </g:link>
                            </div>
                        </li>
                        <li class="fieldcontain">
                            <span id="project-label" class="property-label">Project</span>
                            <div class="property-value" aria-labelledby="project-label">
                                <g:link class="no-underline" controller="project" action="show" id="${this.requirement?.project?.id}">
                                    ${this.requirement?.project?.name}
                                </g:link>
                            </div>
                        </li>
                    </ol>
                    <g:form resource="${this.requirement}" method="DELETE">
                        <fieldset class="buttons">
                            <g:link class="edit" action="edit" resource="${this.requirement}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                            <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                        </fieldset>
                    </g:form>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>
