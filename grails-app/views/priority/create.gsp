<%@ taglib prefix="input" uri="/input" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'priority.label', default: 'Priority')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <script>
            function updateColorText(color) {
                document.getElementById("color-text").value = color;
            }
        </script>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#create-priority" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="create-priority" class="col-12 content scaffold-create" role="main">
                    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${this.priority}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${this.priority}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                    </g:hasErrors>
                    <g:form resource="${this.priority}" method="POST">
                        <fieldset class="form">
                            <f:all bean="priority" except="color"/>
                            <div class="fieldcontain">
                                <label for="color">Color:</label>
                                <color:color id="color" name="color" value="${priority.color ? priority.color : '#ffffff'}" onChange="updateColorText(this.value)" />
                                <input id="color-text" name="color-text" type="text" value="${priority.color ? priority.color : '#ffffff'}" />
                            </div>
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
<script>
</script>
</html>
