<!doctype html>
<html>
<head>
    <title>Управління користувачами</title>
</head>
<body>
    <div class="row px-3">
        <div class="col">
            <h3 class="text-center pb-4">Перегляд користувачів</h3>
            <div class="row pb-3">
                <div class="col-8">
                    <p class="pb-3">Для перегляду користувачів виберіть відповідний пункт у меню, яке з'явиться після авторизації.</p>
                    <p class="">Оберіть пункт меню "Управління користувачами", та відкриється наступна сторінка</p>
                </div>
                <div class="col">
                    <g:clickableImage src="${assetPath(src: '/static/instructions/users/1.png')}" classes="cursor-pointer shadow-lg custom-image-50" onclick="showImagePopup('modalInstructionUsers1')" id="instructionUsers1" idModal="modalInstructionUsers1"/>
                </div>
            </div>
            <g:clickableImage src="${assetPath(src: '/static/instructions/users/2.png')}" classes="cursor-pointer shadow-lg custom-image-70 rounded custom-margin-1p25rem-bot" onclick="showImagePopup('modalInstructionUsers2')" id="instructionUsers2" idModal="modalInstructionUsers2"/>
            <p class="pb-3">Ви можете натиснути на рядок з певним користувачем, щоб переглянути інформацію про нього</p>
            <p>Рядок з авторизованим користувачем буде виділений сірим кольором.</p>
        </div>
    </div>
    <hr class="custom-divider custom-padding"/>
    <div class="row px-3">
        <div class="col">
            <h3 class="text-center pb-4">Редагування користувача</h3>
            <p class="pb-3">Як адміністратор, у Вас є можливість змінити загальну інформацію користувачів.</p>
            <p class="pb-3">Для цього оберіть необхідного користувача у таблиці, та відкриється сторінка, де вказана основна інформація.</p>
            <g:clickableImage src="${assetPath(src: '/static/instructions/users/3.png')}" classes="cursor-pointer shadow-lg custom-image-70 rounded custom-margin-1p25rem-bot" onclick="showImagePopup('modalInstructionUsers3')" id="instructionUsers3" idModal="modalInstructionUsers3"/>
            <p class="pb-3">Натисніть на кнопку "Включити редагування", змініть значення полів, а потім натисніть на кнопку "Створити".</p>
            <p class="pb-3">Якщо редагування пройшло успішно, то Ви побачете повидомлення про це.</p>
        </div>
    </div>
    <hr class="custom-divider custom-padding"/>
    <div class="row px-3">
        <div class="col">
            <h3 class="text-center pb-4">Створення нового користувача</h3>
            <p class="pb-3">В системі відсутня можливість зареєструватись самостійно. Для реєстрації необхідно отримати лист на пошту, який може відправити тільки адміністратор</p>
            <p class="pb-3">Щоб додати користувача до системи, перейдіть в пункт "Управління користувачами" та натисніть на кнопку "Додати користувача". Ви побачите наступне вікно:</p>
            <g:clickableImage src="${assetPath(src: '/static/instructions/users/4.png')}" classes="cursor-pointer shadow-lg custom-image-70 rounded custom-margin-1p25rem-bot" onclick="showImagePopup('modalInstructionUsers4')" id="instructionUsers4" idModal="modalInstructionUsers4"/>
            <p>Введіть коректну пошту, оберіть роль у системі та натисніть кнопку "Відправити запрошення". Після цього повідомлення буде відправлено на вказану електрону пошту.</p>
            <div class="custom-warning-message">
                <h5 class="custom-font-weight-600">Зауваження щодо ролі в системі</h5>
                <p>Всього в системі 2 ролі - користувач та адміністратор.</p>
                <p>Можливості кожного наведені в таблиці нижче.</p>
                <table class="table mt-4">
                    <thead>
                        <tr>
                            <th scope="col">Функція</th>
                            <th scope="col">Користувач</th>
                            <th scope="col">Адміністратор</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">Управління новинами</th>
                            <td><img src="${assetPath(src:'/static/ok.png')}" class="custom-icon-32 m-auto"/></td>
                            <td><img src="${assetPath(src:'/static/ok.png')}" class="custom-icon-32 m-auto"/></td>
                        </tr>
                        <tr>
                            <th scope="row">Управління розкладом</th>
                            <td><img src="${assetPath(src:'/static/ok.png')}" class="custom-icon-32 m-auto"/></td>
                            <td><img src="${assetPath(src:'/static/ok.png')}" class="custom-icon-32 m-auto"/></td>
                        </tr>
                        <tr>
                            <th scope="row">Управління FAQ</th>
                            <td><img src="${assetPath(src:'/static/ok.png')}" class="custom-icon-32 m-auto"/></td>
                            <td><img src="${assetPath(src:'/static/ok.png')}" class="custom-icon-32 m-auto"/></td>
                        </tr>
                        <tr>
                            <th scope="row">Управління користувачами</th>
                            <td><img src="${assetPath(src:'/static/no.png')}" class="custom-icon-32 m-auto"/></td>
                            <td><img src="${assetPath(src:'/static/ok.png')}" class="custom-icon-32 m-auto"/></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <p class="pb-3">Коли користувач отримає лист на пошту, він побачить такий текст: </p>
            <g:clickableImage src="${assetPath(src: '/static/instructions/users/5.png')}" classes="cursor-pointer shadow-lg custom-image-80 rounded custom-margin-1p25rem-bot" onclick="showImagePopup('modalInstructionUsers5')" id="instructionUsers5" idModal="modalInstructionUsers5"/>
            <p class="pb-3">Сторінка реєстрації виглядає так: </p>
            <g:clickableImage src="${assetPath(src: '/static/instructions/users/6.png')}" classes="cursor-pointer shadow-lg custom-image-80 rounded custom-margin-1p25rem-bot" onclick="showImagePopup('modalInstructionUsers6')" id="instructionUsers6" idModal="modalInstructionUsers6"/>
            <p class="pb-3">Якщо новий користувач буде адміністратором, то він побачить про це повідомлення: </p>
            <g:clickableImage src="${assetPath(src: '/static/instructions/users/7.png')}" classes="cursor-pointer shadow-lg custom-image-80 rounded custom-margin-1p25rem-bot" onclick="showImagePopup('modalInstructionUsers7')" id="instructionUsers7" idModal="modalInstructionUsers7"/>
            <p class="pb-3">Після успішної реєстрації, буде здійснений перехід на головну сторінку (Новини), та користувач побачить повідомленя з рекомендацією обзнайомитись з інструкцією.</p>
            <g:clickableImage src="${assetPath(src: '/static/instructions/users/8.png')}" classes="cursor-pointer shadow-lg custom-image-80 rounded custom-margin-1p25rem-bot" onclick="showImagePopup('modalInstructionUsers8')" id="instructionUsers8" idModal="modalInstructionUsers8"/>
        </div>
    </div>
</body>
</html>
