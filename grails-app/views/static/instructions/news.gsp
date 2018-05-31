<!doctype html>
<html>
<head>
    <title>Управління новинами</title>
</head>
<body>
    <div class="row px-3">
        <div class="col">
            <h3 class="text-center pb-4">Створення новини</h3>
            <div class="row pb-3">
                <div class="col-auto">
                    <p class="pb-3">Для створення новини виберіть відповідний пункт у меню, яке з'явиться після авторизації.</p>
                    <p class="">Оберіть пункт меню "Додати новину", та відкриється наступна сторінка</p>
                </div>
                <div class="col">
                    <img src="${assetPath(src: '/static/instructions/news/1.png')}" class="custom-image-30 shadow"/>
                </div>
            </div>
            <img src="${assetPath(src: '/static/instructions/news/2.png')}" class="custom-image-70 shadow rounded custom-margin-1p25rem-bot"/>
            <p>Вам необхідно заповнити все поля, щоб з'явилась можливість натиснути кнопку "Створити".</p>
            <div class="custom-warning-message">
                <h5 class="custom-font-weight-600">Зауваження щодо картинок</h5>
                <ul>
                    <li class="ml-3">Приймаються тільки картинки з розширенням .jpg, .png, .jpeg</li>
                    <li class="ml-3">Бажано додавати картинки з відношенням сторін 16:9 (тобто, висота = ширина / 9 * 16)</li>
                </ul>
            </div>
            <p>Після створення новини, Вас переадресує на сторінку для її перегляду.</p>
            <div class="custom-warning-message">
                <h5 class="custom-font-weight-600">Зауваження щодо створення новин</h5>
                <ul>
                    <li class="ml-3">Після створення новини її <strong>неможливо</strong> видалити!</li>
                    <li class="ml-3">Бажано додавати дукілька картинок вкцінці новини, щоб вони гарно відображались.</li>
                    <li class="ml-3">Як автор буде вказана людина, яка була авторизована на момент сбереження новини.</li>
                    <li class="ml-3">Дата створення буде визначена саме під час натиснення на кнопку "Створити". В жодному разі не раніше.</li>
                </ul>
            </div>
        </div>
    </div>
    <hr class="custom-divider custom-padding"/>
    <div class="row px-3">
        <div class="col">
            <h3 class="text-center">Перегляд новин</h3>
            <h4>1. На головній сторінці</h4>
            <img src="${assetPath(src: '/static/instructions/news/3.png')}" class="custom-image-80 shadow mb-3"/>
            <ol>
                <li class="ml-3">Головна картинка новини</li>
                <li class="ml-3">Заголовок новини</li>
                <li class="ml-3">Короткий опис новини</li>
                <li class="ml-3">Дата створення новини</li>
                <li class="ml-3">Автор новини</li>
            </ol>
            <h4 class="mt-4">2. Зміст новини</h4>
            <img src="${assetPath(src: '/static/instructions/news/4.png')}" class="custom-image-80 shadow mb-3"/>
            <ol>
                <li class="ml-3">Заголовок новини</li>
                <li class="ml-3">Короткий опис новини</li>
                <li class="ml-3">Головна картинка новини</li>
                <li class="ml-3">Головний текст новини</li>
                <li class="ml-3">Додаткові картинки новини</li>
                <li class="ml-3">Дата створення новини</li>
                <li class="ml-3">Автор новини</li>
            </ol>
        </div>
    </div>
    <hr class="custom-divider custom-padding"/>
    <div class="row">
        <div class="col">
            <h3 class="text-center">Редагування новини</h3>
            %{--todo--}%
        </div>
    </div>
</body>
</html>