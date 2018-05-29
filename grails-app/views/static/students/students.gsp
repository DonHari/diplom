<!doctype html>
<html>
    <head>
        <title><g:message code="header.student" default="For students"/></title>
        <meta name="layout" content="main">
        <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
    </head>
    <body>
        <div class="row">
            <div class="col-2 pt-3">
                <div class="list-group">
                    <a href="#schedule" onclick="loadSchedulePage('#studentContent')" class="list-group-item list-group-item-action custom-sidebar" id="studentsSchedule"><g:message code="students.schedule" default="Schedule"/></a>
                    <a href="#radioSection" onclick="loadRadioSectionPage('#studentContent')" class="list-group-item list-group-item-action custom-sidebar" id="studentsRadioSection">Радіогурток</a>
                    <a href="#contacts" onclick="loadContactsPage('#studentContent')" class="list-group-item list-group-item-action custom-sidebar" id="studentsContacts">Корисні контакти</a>
                </div>
            </div>
            <div class="col-8 content pt-3 pb-3" id="studentContent">
                %{--content here--}%
            </div>
            <div class="offset-2"></div>
        </div>
        <script>
            window.onload = function () {
                loadSchedulePage('#studentContent');
            }
        </script>
    </body>
</html>
