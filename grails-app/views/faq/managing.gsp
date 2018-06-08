<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Перегляд FAQ</title>
</head>
<body>
    <div class="row">
        <div class="offset-2"></div>
        <div class="col-8 content pt-3 pb-3">
            <g:if test="${!faqList || faqList.size() == 0}">
                <h4 class="text-center">У вас відсутня можливість редагувати питання. Редагувати питання може тільки автор та адміністратор.</h4>
            </g:if>
            <g:else>
                <g:if test="${justUpdated}">
                    <div class="alert alert-dismissible alert-success">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        Ви успішно змінили питання!
                    </div>
                </g:if>
                <div class="row pb-3 align-items-center justify-content-between">
                    <div class="col-auto text-muted ml-auto">
                        Всього рядків: ${faqList.size()}
                    </div>
                </div>
                <table class="table table-responsive-lg table-striped table-hover">
                    %{--<caption>Всього рядків: ${faqList.size()}</caption>--}%
                    <thead class="bg-primary text-white">
                        <tr>
                            <th scope="col" class="custom-th">№</th>
                            <th width="40%" scope="col" class="custom-th">Питання</th>
                            <th width="40%" scope="col" class="custom-th">Відповідь</th>
                            <th width="15%" scope="col" class="custom-th">Для кого</th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${faqList}" var="faq" status="i">
                            <tr class="cursor-pointer clickable-row" data-href="${createLink(controller: 'faq', action: 'show', params: [id: faq.id])}">
                                <th scope="row">${i + 1}</th>
                                <td class="text-justify">${faq.question}</td>
                                <td class="text-justify">${faq.answer}</td>
                                <td><g:resolveFaqType type="${faq.faqType.type}"/></td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </g:else>
        </div>
        <div class="offset-2"></div>
    </div>
</body>
</html>
