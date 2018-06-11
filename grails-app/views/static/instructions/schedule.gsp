<!doctype html>
<html>
<head>
    <title>Управління розкладом</title>
</head>
<body>
    <div class="row px-3">
        <div class="col">
            <h3 class="text-center pb-4">Створення розкладу</h3>
            <div class="row pb-3">
                <div class="col-8">
                    <p class="pb-3">Для створення розкладу виберіть відповідний пункт у меню, яке з'явиться після авторизації.</p>
                    <p class="">Оберіть пункт меню "Додати розклад", та відкриється наступна сторінка</p>
                </div>
                <div class="col">
                    <g:clickableImage src="${assetPath(src: '/static/instructions/schedule/1.png')}" classes="cursor-pointer shadow-lg custom-image-50" onclick="showImagePopup('modalInstructionSchedule1')" id="instructionSchedule1" idModal="modalInstructionSchedule1"/>
                </div>
            </div>
            <g:clickableImage src="${assetPath(src: '/static/instructions/schedule/2.png')}" classes="cursor-pointer shadow-lg custom-image-70 rounded custom-margin-1p25rem-bot" onclick="showImagePopup('modalInstructionSchedule2')" id="instructionSchedule2" idModal="modalInstructionSchedule2"/>
            <p>Вам необхідно заповнити всі поля, щоб з'явилась можливість натиснути кнопку "Створити".</p>
            <div class="custom-warning-message">
                <h5 class="custom-font-weight-600">Зауваження щодо файлу</h5>
                <ul>
                    <li class="ml-3">Приймаються тільки файли з розширенням .xls, .xlsx, .csv</li>
                    <li class="ml-3">Максимальний розмір файлу - 25 МБ</li>
                </ul>
            </div>
            <p>Після створення розкладу, значення всіх полів будут встановлені в значення за-змовчанням, а також з'явиться повідомлення про створення розкладу.</p>
            <div class="custom-warning-message">
                <h5 class="custom-font-weight-600">Зауваження щодо створення розкладу</h5>
                <ul>
                    <li class="ml-3">Після створення розкладу його <strong>неможливо</strong> видалити!</li>
                    <li class="ml-3">Якщо розклад вже існує на обраний тетраместр та рік навчання, то Ви побачите повідомлення про це.</li>
                    <li class="ml-3">Обов'язково ім'я файлу буде таке: &lt;рік_навчання&gt;_&lt;тетрамество&gt;.&lt;розширення&gt; Наприклад: 2018_3.xls</li>
                    <li class="ml-3">Рік навчання може бути не більше поточного року.</li>
                </ul>
            </div>
        </div>
    </div>
    <hr class="custom-divider custom-padding"/>
    <div class="row px-3">
        <div class="col">
            <h3 class="text-center pb-4">Перегляд розкладу</h3>
            <g:clickableImage src="${assetPath(src: '/static/instructions/schedule/3.png')}" classes="cursor-pointer shadow-lg custom-image-70 rounded custom-margin-1p25rem-bot" onclick="showImagePopup('modalInstructionSchedule3')" id="instructionSchedule3" idModal="modalInstructionSchedule3"/>
            <ol>
                <li class="ml-3">Випадаючий список для вибору тетраместру.</li>
                <li class="ml-3">Випадаючий список для вибору учбового року.</li>
                <li class="ml-3">Посилання для завантаження файлу розкладу. Якщо розкладу на обраний тетраместр та учбовий рік не існує, то замість посилання буде звичайний напис, який інформує про це.</li>
            </ol>
        </div>
    </div>
</body>
</html>