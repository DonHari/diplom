<!DOCTYPE html>
<html>
    <head>
        <title><g:message code="students.schedule" default="Schedule"/></title>
        <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
    </head>
    <body>
        <form>
            <fieldset>
                <legend>Выберите нужные опции</legend>
                <div class="row">
                    <div class="col-5">
                        <div class="form-group">
                            <label for="tetrameterSelect">Тетраместр</label>
                            <select class="form-control" id="tetrameterSelect" onchange="loadSchedule()">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                            </select>
                        </div>
                    </div>
                    <div class="offset-2"></div>
                    <div class="col-5">
                        <div class="form-group">
                            <label for="yearSelect">Учебный год</label>
                            <select class="form-control" id="yearSelect" onchange="loadSchedule()">
                                <g:each in="${availableYears}" var="year">
                                    <g:if test="${currentYear == year}">
                                        <option selected>${year}</option>
                                    </g:if>
                                    <g:else>
                                        <option>${year}</option>
                                    </g:else>
                                </g:each>
                            </select>
                        </div>
                    </div>
                </div>
            </fieldset>
        </form>
        <div class="row">
            <div class="col-12" id="scheduleFileLink">

            </div>
        </div>
        <script>
            $(document).ready(function () {
                loadSchedule();
            })
        </script>
    </body>
</html>