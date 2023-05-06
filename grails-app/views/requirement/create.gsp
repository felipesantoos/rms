<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'requirement.label', default: 'Requirement')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <style>
            .form {
                display: flex;
                flex-direction: column;
            }
            input[type=text], textarea {
                width: 50%;
            }
        </style>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#create-requirement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="create-requirement" class="col-12 content scaffold-create" role="main">
                    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${this.requirement}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${this.requirement}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                    </g:hasErrors>
                    <g:form resource="${this.requirement}" method="POST">
                        <fieldset class="form">
                            <fieldset class="form">
                                <div class="fieldcontain required">
                                    <label for="title">Title<span class="required-indicator">*</span></label>
                                    <input type="text" name="title" value="" required="" id="title">
                                </div>
                                <div class="fieldcontain">
                                    <label for="description">Description</label>
                                    <textarea name="description" id="description" cols="30" rows="10"></textarea>
                                </div>
                            <div class="fieldcontain">
                                <label for="userStory">User Story</label>
                                <textarea name="userStory" id="userStory" cols="30" rows="10"></textarea>
                            </div>
                            <div class="fieldcontain">
                                <label for="type">Type</label>
                                <select name="type.id" id="type">
                                    <option value="">-- Escolha um tipo --</option>
                                    <g:each in="${requirementTypeList}" var="requirementType">
                                        <option value="${requirementType.id}">${requirementType.name}</option>
                                    </g:each>
                                </select>
                            </div>
                            <div class="fieldcontain">
                                <label for="origin">Origin</label>
                                <select name="origin.id" id="origin">
                                    <option value="">-- Escolha uma origem --</option>
                                    <g:each in="${requirementOriginList}" var="requirementOrigin">
                                        <option value="${requirementOrigin.id}">${requirementOrigin.name}</option>
                                    </g:each>
                                </select>
                            </div>
                            <div class="fieldcontain">
                                <label for="priority">Priority</label>
                                <select name="priority.id" id="priority">
                                    <option value="">-- Escolha uma prioridade --</option>
                                    <g:each in="${priorityList}" var="priority">
                                        <option value="${priority.id}">${priority.level}</option>
                                    </g:each>
                                </select>
                            </div>
                                <div class="fieldcontain required">
                                    <label for="project">Project<span class="required-indicator">*</span></label>
                                    <select name="project.id" required="" id="project">
                                    <option value="">-- Escolha um projeto --</option>
                                    <g:each in="${projectList}" var="project">
                                        <option value="${project.id}">${project.name}</option>
                                    </g:each>
                                </select>
                            </div>
                            </fieldset>
                        </fieldset>
                        <fieldset class="buttons">
                            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                        </fieldset>
                    </g:form>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>
