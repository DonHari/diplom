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
                    <a href="#schedule" onclick="loadSchedulePage()" class="list-group-item list-group-item-action" id="studentsSchedule"><g:message code="students.schedule" default="Schedule"/></a>
                    <a href="#faculty" onclick="" class="list-group-item list-group-item-action" id="studentsFaculty"><g:message code="students.faculty" default="About faculty"/></a>
                    <a href="#department" onclick="" class="list-group-item list-group-item-action" id="studentsDepartment"><g:message code="students.department" default="About department"/></a>
                    <a href="#studcity" onclick="loadStudcityPage()" class="list-group-item list-group-item-action" id="studentsStudcity"><g:message code="students.studcity" default="Student's city"/></a>
                </div>
            </div>
            <div class="col-8 content">
                <div class="row pt-lg-3 pt-md-3 pb-lg-3 pb-md-3">
                    <div class="col-lg-8 col-md-8" id="content">
                    </div>
                </div>
            </div>
            <div class="offset-2"></div>
        </div>
        <script>
            window.onload = function (ev) {
                loadSchedulePage();
            }
        </script>
    </body>
</html>
