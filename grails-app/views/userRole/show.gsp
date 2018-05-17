<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>SHOW USER</title>
    </head>
    <body>
        <div class="row">
            <div class="offset-3"></div>
            <div class="col-6 content pt-3 pb-3">
                %{--todo add edit button--}%
                <form action="${createLink(action: 'save')}">
                    <div class="row">
                        <div class="col-4">
                            <div class="form-group has-danger has-success">
                                <label class="control-label" for="scheduleYear"><g:message code="schedule.add.year"/></label>
                                <input class="form-control" type="number" id="scheduleYear" maxlength="50" value="${year ?: 2018}" name="year" onblur="" min="2018" max="2030"/>
                                <div class="invalid-feedback"><g:message code="error.wrongYear"/></div>
                            </div>
                        </div>
                        <div class="col-4">

                        </div>
                        <div class="col-4">

                        </div>
                    </div>
                </form>
            </div>
            <div class="offset-3"></div>
        </div>
    </body>
</html>
