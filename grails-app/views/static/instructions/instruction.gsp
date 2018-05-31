<!doctype html>
<html>
<head>
    <title>Інструкції</title>
    <meta name="layout" content="main">
</head>
<body>
    <div class="row">
        <div class="col-2 pt-3">
            <div class="list-group">
                <a href="#news" onclick="loadNewsInstructionPage()" class="list-group-item list-group-item-action custom-sidebar" id="instructionsNews">Управління новинами</a>
                <a href="#schedule" onclick="loadScheduleInstructionPage()" class="list-group-item list-group-item-action custom-sidebar" id="instructionsSchedule">Управління розкладом</a>
                <a href="#faq" onclick="loadFaqInstructionPage()" class="list-group-item list-group-item-action custom-sidebar" id="instructionsFaq">Управління FAQ</a>
                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <a href="#users" onclick="loadUsersInstructionPage()" class="list-group-item list-group-item-action custom-sidebar" id="instructionsUsers">Управління користувачами</a>
                </sec:ifAllGranted>
                <a href="#my" onclick="loadMyInstructionPage()" class="list-group-item list-group-item-action custom-sidebar" id="instructionsMy">Управління аккаунтом</a>
            </div>
        </div>
        <div class="col-8 content pt-3 pb-3" id="instructionContent">
            %{--content here--}%
        </div>
        <div class="offset-2"></div>
    </div>
    <script>
        window.onload = function () {
            loadNewsInstructionPage();
        }
    </script>
</body>
</html>
