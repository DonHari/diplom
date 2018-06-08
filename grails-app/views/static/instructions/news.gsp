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
                <div class="col-8">
                    <p class="pb-3">Для створення новини виберіть відповідний пункт у меню, яке з'явиться після авторизації.</p>
                    <p class="">Оберіть пункт меню "Додати новину", та відкриється наступна сторінка</p>
                </div>
                <div class="col">
                    <img src="${assetPath(src: '/static/instructions/news/1.png')}" class="custom-image-50 shadow"/>
                </div>
            </div>
            <img src="${assetPath(src: '/static/instructions/news/2.png')}" class="custom-image-70 shadow rounded custom-margin-1p25rem-bot"/>
            <p>Вам необхідно заповнити всі поля, щоб з'явилась можливість натиснути кнопку "Створити".</p>
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
                    <li class="ml-3">Бажано додавати декілька картинок вкцінці новини, щоб вони гарно відображались.</li>
                    <li class="ml-3">Як автор буде вказана людина, яка була авторизована на момент сбереження новини.</li>
                    <li class="ml-3">Дата створення буде визначена саме під час натиснення на кнопку "Створити". В жодному разі не раніше.</li>
                </ul>
            </div>
        </div>
    </div>
    <hr class="custom-divider custom-padding"/><div class="row px-3">
        <div class="col">
            <h3 class="text-center pb-4">Стиль в новинах</h3>
            <p class="pb-3">Ви можете форматувати зміст новин. Для цього можна використовувати символи, які вказані в таблиці нижче</p>
            <div class="row">
                <div class="col-6">
                    <table class="table table-responsive-lg table-striped text-center">
                        <thead class="bg-primary text-white">
                            <tr>
                                <th scope="col" class="custom-th">Як встановити</th>
                                <th scope="col" class="custom-th">Приклад</th>
                                <th scope="col" class="custom-th">Результат</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>**</td>
                                <td>**текст**</td>
                                <td><strong>текст</strong></td>
                            </tr>
                            <tr>
                                <td>&&</td>
                                <td>&&текст&&</td>
                                <td><mark>текст</mark></td>
                            </tr>
                            <tr>
                                <td>!!</td>
                                <td>текст!!текст!!</td>
                                <td>текст<small>текст</small></td>
                            </tr>
                            <tr>
                                <td>::</td>
                                <td>::текст::</td>
                                <td>текст<sub>текст</sub></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-6">
                    <table class="table table-responsive-lg table-striped text-center">
                        <thead class="bg-primary text-white">
                        <tr>
                            <th scope="col" class="custom-th">Як встановити</th>
                            <th scope="col" class="custom-th">Приклад</th>
                            <th scope="col" class="custom-th">Результат</th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>__</td>
                                <td>__текст__</td>
                                <td><i>текст</i></td>
                            </tr>
                            <tr>
                                <td>--</td>
                                <td>--текст--</td>
                                <td><del>текст</del></td>
                            </tr>
                            <tr>
                                <td>==</td>
                                <td>==текст==</td>
                                <td><ins>текст</ins></td>
                            </tr>
                            <tr>
                                <td>^^</td>
                                <td>^^текст^^</td>
                                <td>текст<sup>текст</sup></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <p class="">Також є можливість додати посилання. Для цього введіть наступне: [посилання](текст)</p>
            <p>Наприклад: [http://udhtu.edu.ua/](Сайт УДХТУ)</p>
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
    <div class="row px-3">
        <div class="col">
            <h3 class="text-center">Редагування новини</h3>
            <p class="pb-3">Якщо ви автор новини або адміністратор, то при перегляді списку новин Ви побачите справа від назви новини інформацію про можливість редагування.</p>
            <img src="${assetPath(src: '/static/instructions/news/5.png')}" class="custom-image-80 shadow rounded custom-margin-1p25rem-bot"/>
            <p class="pb-3">Вам достатньо натиснути на напис "Можно редагувати" та відкриється відповідна сторінка.</p>
            <p class="pb-3">Сторінка редагування практично така ж, як і для додавання новини. Різниця в тому, що всі поля будуь все заповнені прі переході на неї.</p>
            <img src="${assetPath(src: '/static/instructions/news/6.png')}" class="custom-image-80 shadow rounded custom-margin-1p25rem-bot"/>
            <p class="pb-3">Після оновлення Ви повернетесь на головну сторінку та біля оновленної новини побачите інформацію про це.</p>
            <img src="${assetPath(src: '/static/instructions/news/7.png')}" class="custom-image-80 shadow rounded custom-margin-1p25rem-bot"/>
        </div>
    </div>
</body>
</html>