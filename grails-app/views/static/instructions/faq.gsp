<!doctype html>
<html>
<head>
    <title>Управління FAQ</title>
</head>
<body>
    <div class="custom-warning-message mx-3">
        <p>FAQ (<em>англ.</em> friendly asked question) - це поширені питання та відповіді на них</p>
        <p>Взагалі, FAQ - це сам список питань та він може бути розширений</p>
    </div>
    <div class="row px-3">
        <div class="col">
            <h3 class="text-center pb-4">Створення FAQ</h3>
            <div class="row pb-3">
                <div class="col-8">
                    <p class="pb-3">Для створення питання виберіть відповідний пункт у меню, яке з'явиться після авторизації.</p>
                    <p class="">Оберіть пункт меню "Додати FAQ", та відкриється наступна сторінка</p>
                </div>
                <div class="col">
                    <g:clickableImage src="${assetPath(src: '/static/instructions/faq/1.png')}" classes="cursor-pointer shadow-lg custom-image-50" onclick="showImagePopup('modalInstructionFaq1')" id="instructionFaq1" idModal="modalInstructionFaq1"/>
                </div>
            </div>
            <g:clickableImage src="${assetPath(src: '/static/instructions/faq/2.png')}" classes="cursor-pointer shadow-lg custom-image-70" onclick="showImagePopup('modalInstructionFaq2')" id="instructionFaq2" idModal="modalInstructionFaq2"/>
            <p>Вам необхідно заповнити всі поля, щоб з'явилась можливість натиснути кнопку "Створити".</p>
            <p>Після створення питання, значення всіх полів будут встановлені в значення за-змовчанням, а також з'явиться повідомлення про його створення.</p>
            <div class="custom-warning-message">
                <h5 class="custom-font-weight-600">Зауваження щодо створення новин</h5>
                <ul>
                    <li class="ml-3">Після створення питання його <strong>неможливо</strong> видалити!</li>
                    <li class="ml-3">Питання можуть бути для студентів і для абітурієнтів. Різниця в сторінках, на яких їх можна переглянути.</li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>