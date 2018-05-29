<!DOCTYPE html>
<html>
<head>
    <title>Часті запитання</title>
</head>
<body>
    <div class="row p-3 custom-font-size-1p2">
        <div class="col">
            <g:each in="${faqList}" var="faq" status="i">
                <div class="row">
                    <div class="col">
                        <a class="" data-toggle="collapse" href="#multiCollapseExample${i}" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">${i + 1}. ${faq.question}</a>
                        <div class="collapse multi-collapse mt-1 mb-3" id="multiCollapseExample${i}">
                            <div class="card card-body">
                                ${faq.answer}
                            </div>
                        </div>
                    </div>
                </div>
            </g:each>
        </div>
    </div>
</body>
</html>