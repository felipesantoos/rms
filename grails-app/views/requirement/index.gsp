<%@ page import="rms.Requirement" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'requirement.label', default: 'Requirement')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <script>
            function filterByRequirementType() {
                let priorityFilter = document.getElementById("type-filter");
                let selectedPriority = priorityFilter.value;
                let tableBody = document.getElementsByTagName("tbody")[0];
                for (let i = 0; i < tableBody.rows.length; i++) {
                    let rowPriority = tableBody.rows[i].cells[2].textContent.trim();
                    if (selectedPriority === "" || rowPriority === selectedPriority) {
                        tableBody.rows[i].style.display = "";
                    } else {
                        tableBody.rows[i].style.display = "none";
                    }
                }
            }
            function filterByRequirementOrigin() {
                let priorityFilter = document.getElementById("origin-filter");
                let selectedPriority = priorityFilter.value;
                let tableBody = document.getElementsByTagName("tbody")[0];
                for (let i = 0; i < tableBody.rows.length; i++) {
                    let rowPriority = tableBody.rows[i].cells[3].textContent.trim();
                    if (selectedPriority === "" || rowPriority === selectedPriority) {
                        tableBody.rows[i].style.display = "";
                    } else {
                        tableBody.rows[i].style.display = "none";
                    }
                }
            }
            function filterByPriority() {
                let priorityFilter = document.getElementById("priority-filter");
                let selectedPriority = priorityFilter.value;
                let tableBody = document.getElementsByTagName("tbody")[0];
                for (let i = 0; i < tableBody.rows.length; i++) {
                    let rowPriority = tableBody.rows[i].cells[4].querySelector("span").textContent.trim();
                    if (selectedPriority === "" || rowPriority === selectedPriority) {
                        tableBody.rows[i].style.display = "";
                    } else {
                        tableBody.rows[i].style.display = "none";
                    }
                }
            }
        </script>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#list-requirement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="list-requirement" class="col-12 content scaffold-list" role="main">
                    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <div style="display: flex; justify-content: space-evenly;">
                        <form>
                            <label for="type-filter">Type:</label>
                            <select name="type-filter" id="type-filter" onchange="filterByRequirementType()">
                                <option value="">-- Select Type --</option>
                                <g:each in="${requirementTypeList}" var="requirementType">
                                    <option value="${requirementType.name}">${requirementType.name}</option>
                                </g:each>
                            </select>
                        </form>
                        <form>
                            <label for="origin-filter">Origin:</label>
                            <select name="origin-filter" id="origin-filter" onchange="filterByRequirementOrigin()">
                                <option value="">-- Select Origin --</option>
                                <g:each in="${requirementOriginList}" var="requirementOrigin">
                                    <option value="${requirementOrigin.name}">${requirementOrigin.name}</option>
                                </g:each>
                            </select>
                        </form>
                        <form>
                            <label for="priority-filter">Priority:</label>
                            <select name="priority-filter" id="priority-filter" onchange="filterByPriority()">
                                <option value="">-- Select Priority --</option>
                                <g:each in="${priorityList}" var="priority">
                                    <option value="${priority.level}">${priority.level}</option>
                                </g:each>
                            </select>
                        </form>
                    </div>
                    <table class="table">
                        <thead>
                        <tr>
                            <g:sortableColumn property="code" title="Code" />
                            <g:sortableColumn property="title" title="Title" />
                            <g:sortableColumn property="type" title="Type" />
                            <g:sortableColumn property="origin" title="Origin" />
                            <g:sortableColumn property="priority" title="Priority" />
                        </tr>
                        </thead>

                        <tbody>
                        <g:each in="${requirementList as ArrayList<Requirement>}" var="requirement">
                        <tr>
                            <td><a href="show/${requirement.id}">${requirement.code}</a></td>
                            <td>${requirement.title}</td>
                            <td>${requirement.type}</td>
                            <td>${requirement.origin}</td>
                            <td>
                                <span style="background: ${requirement.priority.color}; display: inline-block; border-radius: 2px; padding: 0 4px;">
                                    ${requirement.priority.level}
                                </span>
                            </td>
                        </tr>
                        </g:each>
                        <!-- additional rows for each object in the "requirementList" collection -->
                        </tbody>
                    </table>
                    <g:if test="${requirementCount > params.int('max')}">
                    <div class="pagination">
                        <g:paginate total="${requirementCount ?: 0}" />
                    </div>
                    </g:if>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>