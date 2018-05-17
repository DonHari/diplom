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
                            <div class="form-group">
                                <label for="userSurname" class="form-label">Email</label>
                                <input type="text" class="form-control" id="userSurname" value="${userRole.user.surname}" name="surname" disabled=""/>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <label for="userName" class="form-label">Email</label>
                                <input type="text" class="form-control" id="userName" value="${userRole.user.name}" name="name"/>
                            </div>
                        </div>
                        <div class="col-4"></div>
                    </div>
                </form>
            </div>
            <div class="offset-3"></div>
        </div>
    </body>
</html>
