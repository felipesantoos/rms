<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
                <a href="#edit-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="edit-project" class="col-12 content scaffold-edit" role="main">
                    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${this.project}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${this.project}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                    </g:hasErrors>
                    <g:form resource="${this.project}" method="PUT">
                        <g:hiddenField name="version" value="${this.project?.version}" />
                        <fieldset class="form">
                            <div class="fieldcontain required">
                                <label for="name">Name<span class="required-indicator">*</span></label>
                                <input type="text" name="name" value="${this.project.name}" required="" id="name">
                            </div>
                            <div class="fieldcontain required">
                                <label for="alias">Alias<span class="required-indicator">*</span></label>
                                <input type="text" name="alias" value="${this.project.alias}" required="" id="alias">
                            </div>
                            <div class="fieldcontain">
                                <label for="description">Description</label>
                                <textarea name="description" id="description" cols="30" rows="10">${this.project.description}</textarea>
                            </div>
                            <div class="fieldcontain">
                                <label for="isActive">Is Active</label>
                                <input type="hidden" name="_isActive">
                                <input type="checkbox" name="isActive" checked="${this.project.isActive}" id="isActive">
                            </div>
                        </fieldset>
                        <fieldset class="buttons">
                            <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                        </fieldset>
                    </g:form>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>
