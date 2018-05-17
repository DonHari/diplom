<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>FAQ</title>
    </head>
    <body>
        <div class="row">
            <div class="offset-3"></div>
            <div class="col-6 content pt-3 pb-3">
                <g:if test="${justSaved}">
                    <div class="alert alert-dismissible alert-success">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <g:message code="schedule.saved.message" default="Ви успішно додали нове питання!"/>
                        <script>
                            $(document).ready(function () {
                                $('#faqQuestion').val('');
                                $('#faqAnswer').val('');
                            });
                        </script>
                    </div>
                </g:if>
                <form action="${createLink(action: 'save')}" method="post" id="faqForm" onsubmit="return checkFaqFields()">
                    <div class="form-group has-danger has-success">
                        <label class="control-label" for="faqQuestion"><g:message code="faq.add.question"/></label>
                        <input class="form-control" type="text" id="faqQuestion" maxlength="100" value="${faq.question}" name="question"/>
                        <div class="invalid-feedback"><g:message code="error.notEmpty"/></div>
                        <small id="faqQuestionLeft" class="form-text text-muted"><g:message code="add.left"/>: 100</small>
                    </div>
                    <div class="form-group has-danger has-success">
                        <label class="control-label" for="faqAnswer"><g:message code="faq.add.answer"/></label>
                        <input class="form-control" type="text" id="faqAnswer" maxlength="100" value="${faq.answer}" name="answer"/>
                        <div class="invalid-feedback"><g:message code="error.notEmpty"/></div>
                        <small id="faqAnswerLeft" class="form-text text-muted"><g:message code="add.left"/>: 100</small>
                    </div>
                    <button type="submit" class="btn btn-primary disabled" id="faqSendButton"><g:message code="add.confirm"/></button>
                </form>
            </div>
            <div class="offset-3"></div>
        </div>
    </body>
</html>
