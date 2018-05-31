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
                <a href="#department" onclick="loadDepartmentPage('#enrolleeContent')" class="list-group-item list-group-item-action custom-sidebar" id="studentsDepartment"><g:message code="students.department" default="About department"/></a>
                <a href="#faculty" onclick="loadFacultyPage('#enrolleeContent')" class="list-group-item list-group-item-action custom-sidebar" id="studentsFaculty"><g:message code="students.faculty" default="About faculty"/></a>
                <a href="#studcity" onclick="loadStudcityPage('#enrolleeContent')" class="list-group-item list-group-item-action custom-sidebar" id="studentsStudcity"><g:message code="students.studcity" default="Student's city"/></a>
                <a href="#program" onclick="loadProgramPage('#enrolleeContent')" class="list-group-item list-group-item-action custom-sidebar" id="studentsProgram">Освітня програма</a>
                <a href="#radioSection" onclick="loadRadioSectionPage('#enrolleeContent')" class="list-group-item list-group-item-action custom-sidebar" id="studentsRadioSection">Радіогурток</a>
                <a href="#faq" onclick="loadEnrolleeFaqPage()" class="list-group-item list-group-item-action custom-sidebar" id="studentsFaq">Часті запитання</a>
            </div>
        </div>
        <div class="col-8 content pt-3 pb-3" id="enrolleeContent">
            %{--content here--}%
        </div>
        <div class="offset-2"></div>
        <script>
            window.onload = function () {
                loadDepartmentPage('#enrolleeContent');
            }
        </script>
    </div>
</body>
</html>