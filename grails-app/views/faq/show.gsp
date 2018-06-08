<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'faq.label', default: 'Faq')}"/>
    <title>Редагування FAQ</title>
</head>
<body>
    <div class="row">
        <div class="offset-3"></div>
        <div class="col-6 content py-3">
            <form action="${createLink(action: 'update', params: [faqId: faq.id])}" method="post" id="faqForm">
                <div class="form-group has-danger has-success">
                    <label class="control-label" for="faqQuestionEdit"><g:message code="faq.add.question"/></label>
                    <input class="form-control" type="text" id="faqQuestionEdit" maxlength="100" value="${faq.question}" name="question" required/>
                    <div class="invalid-feedback"><g:message code="error.notEmpty"/></div>
                    <small id="faqQuestionEditLeft" class="form-text text-muted"><g:message code="add.left"/>: 100</small>
                </div>
                <div class="form-group">
                    <label class="form-label" for="faqType">Для кого буде це питання?</label>
                    <select class="form-control" id="faqType" name="faqType">
                        <g:if test="${faq.faqType.type == "STUDENTS"}">
                            <option value="STUDENTS" selected><g:resolveFaqType type="STUDENTS"/></option>
                            <option value="ENTRANTS"><g:resolveFaqType type="ENTRANTS"/></option>
                        </g:if>
                        <g:else>
                            <option value="STUDENTS"><g:resolveFaqType type="STUDENTS"/></option>
                            <g:if test="${faq.faqType.type == "ENTRANTS"}">
                                <option value="ENTRANTS" selected><g:resolveFaqType type="ENTRANTS"/></option>
                            </g:if>
                            <g:else>
                                <option value="ENTRANTS"><g:resolveFaqType type="ENTRANTS"/></option>
                            </g:else>
                        </g:else>
                    </select>
                </div>
                <div class="form-group has-danger has-success">
                    <label class="control-label" for="faqAnswerEdit"><g:message code="faq.add.answer"/></label>
                    <input class="form-control" type="text" id="faqAnswerEdit" maxlength="100" value="${faq.answer}" name="answer" required/>
                    <div class="invalid-feedback"><g:message code="error.notEmpty"/></div>
                    <small id="faqAnswerEditLeft" class="form-text text-muted"><g:message code="add.left"/>: 100</small>
                </div>
                <button type="submit" class="btn btn-primary" id="faqSendButton"><g:message code="add.confirm"/></button>
                <script>
                    document.onreadystatechange = function () {
                        if(document.readyState === "completed"){
                            maxInput(100, '#faqQuestionEdit', '#faqQuestionEditLeft')
                            maxInput(100, '#faqAnswerEdit', '#faqAnswerEditLeft')
                        }
                    };
                </script>
            </form>
        </div>
        <div class="offset-3"></div>
    </div>
</body>
</html>
