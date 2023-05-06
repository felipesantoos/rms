<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>RMS</title>
    <style>
        .no-underline {
            text-decoration: none;
        }

        .block {
            display: block;
        }
    </style>
</head>
<body>
<div id="content" role="main">
    <div class="container">
        <ul>
            <h1>Menu</h1>
            <li>
                <g:link controller="priority" class="no-underline block">Prioridades</g:link>
            </li>
            <li>
                <g:link controller="requirement" class="no-underline block">Requisitos</g:link>
            </li>
            <li>
                <g:link controller="project" class="no-underline block">Projetos</g:link>
            </li>
            <li>
                <g:link controller="requirementOrigin" class="no-underline block">Origens de requisitos</g:link>
            </li>
            <li>
                <g:link controller="requirementType" class="no-underline block">Tipos de requisitos</g:link>
            </li>
        </ul>
    </div>
</div>

</body>
</html>
