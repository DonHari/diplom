<!DOCTYPE html>
<html>
    <head>
        <title><g:message code="students.schedule" default="Schedule"/></title>
        <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
    </head>
    <body>
        <g:if test="${schedule != null}">
            <a href="${createLink(controller: "schedule", action: "loadFile", params: [fileName: schedule.fileName])}">
                <g:message code="students.schedule.download" default="Download schedule for {0} tetrameter and {1} year" args="[schedule.tetrameter, schedule.year]"/>
            </a>
        </g:if>
        <g:else>
            <p>Файл не знайдено. Можливо, розклад ще не з'явився. Попробуйте пізніше.</p>
        </g:else>
    </body>
</html>