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
                    <img src="${assetPath(src: '/static/instructions/users/1.png')}" class="custom-image-50 shadow"/>
                </div>
            </div>
            <img src="${assetPath(src: '/static/instructions/users/2.png')}" class="custom-image-70 shadow rounded custom-margin-1p25rem-bot"/>
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
            <img src="${assetPath(src: '/static/instructions/users/3.png')}" class="custom-image-70 shadow rounded custom-margin-1p25rem-bot"/>
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
            <img src="${assetPath(src: '/static/instructions/users/4.png')}" class="custom-image-50 shadow rounded custom-margin-1p25rem-bot"/>
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
            <img src="${assetPath(src: '/static/instructions/users/5.png')}" class="custom-image-70 shadow rounded custom-margin-1p25rem-bot"/>
            <p class="pb-3">Сторінка реєстрації виглядає так: </p>
            <img src="${assetPath(src: '/static/instructions/users/6.png')}" class="custom-image-70 shadow rounded custom-margin-1p25rem-bot"/>
            <p class="pb-3">Якщо новий користувач буде адміністратором, то він побачить про це повідомлення: </p>
            <img src="${assetPath(src: '/static/instructions/users/7.png')}" class="custom-image-80 shadow rounded custom-margin-1p25rem-bot"/>
            <p class="pb-3">Після успішної реєстрації, буде здійснений перехід на головну сторінку (Новини), та користувач побачить повідомленя з рекомендацією обзнайомитись з інструкцією.</p>
            <img src="${assetPath(src: '/static/instructions/users/8.png')}" class="custom-image-80 shadow rounded custom-margin-1p25rem-bot"/>
        </div>
    </div>
</body>
</html>
