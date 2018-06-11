<!doctype html>
<html>
<head>
    <title>Управління аккаунтом</title>
</head>
<body>
    <div class="row px-3">
        <div class="col">
            <h3 class="text-center pb-4">Редагування основної інформації</h3>
            <div class="row pb-3">
                <div class="col-8">
                    <p class="pb-3">Для редагування основної інформації (П.І.Б., пошта), натисніть кнопку "Мій аккаунт" справа зверху.</p>
                    <p class="">За-змовчанням буде відкрита вкладка для редагування основної інформації.</p>
                </div>
                <div class="col">
                    <g:clickableImage src="${assetPath(src: '/static/instructions/my/1.png')}" classes="cursor-pointer shadow-lg custom-image-50" onclick="showImagePopup('modalInstructionMy1')" id="instructionMy1" idModal="modalInstructionMy1"/>
                </div>
            </div>
            <g:clickableImage src="${assetPath(src: '/static/instructions/my/2.png')}" classes="cursor-pointer shadow-lg custom-image-70 shadow rounded custom-margin-1p25rem-bot" onclick="showImagePopup('modalInstructionMy2')" id="instructionMy2" idModal="modalInstructionMy2"/>
            <p>Вам достатньо натиснути на кнопку "Включити редагування", змінити інформацію та натиснути на кнопку "Зберігти".</p>
            <p>Після збереження інформації, Ви побачите повідомлення про це, та оновлену інформації у відповідних місцях</p>
        </div>
    </div>
    <hr class="custom-divider custom-padding"/>
    <div class="row px-3">
        <div class="col">
            <h3 class="text-center pb-4">Редагування імені користувача</h3>
            <div class="row pb-3">
                <div class="col-8">
                    <p class="pb-3">Для зміни свого імені користувача, натисніть кнопку "Мій аккаунт" справа зверху.</p>
                    <p class="">Після цього перейдіть на вкладку "Редагування імені користувача".</p>
                </div>
                <div class="col">
                    <g:clickableImage src="${assetPath(src: '/static/instructions/my/1.png')}" classes="cursor-pointer shadow-lg custom-image-50" onclick="showImagePopup('modalInstructionMy1')" id="instructionMy1" idModal="modalInstructionMy1"/>
                </div>
            </div>
            <g:clickableImage src="${assetPath(src: '/static/instructions/my/3.png')}" classes="cursor-pointer shadow-lg custom-image-70 shadow rounded custom-margin-1p25rem-bot" onclick="showImagePopup('modalInstructionMy3')" id="instructionMy3" idModal="modalInstructionMy3"/>
            <div class="custom-warning-message">
                <h5 class="custom-font-weight-600">Зауваження щодо редагування імені користувача</h5>
                <ul>
                    <li class="ml-3">Нове ім'я користувача повинне бути унікальним в рамках системи.</li>
                    <li class="ml-3">Має складатись більш ніж з чотирьох символів</li>
                    <li class="ml-3">Може складатись з літер, цифр і символів</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="row px-3">
        <div class="col">
            <h3 class="text-center pb-4">Редагування паролю</h3>
            <div class="row pb-3">
                <div class="col-8">
                    <p class="pb-3">Для зміни свого паролю, натисніть кнопку "Мій аккаунт" справа зверху.</p>
                    <p class="">Після цього перейдіть на вкладку "Редагування паролю".</p>
                </div>
                <div class="col">
                    <g:clickableImage src="${assetPath(src: '/static/instructions/my/1.png')}" classes="cursor-pointer shadow-lg custom-image-50" onclick="showImagePopup('modalInstructionMy1')" id="instructionMy1" idModal="modalInstructionMy1"/>
                </div>
            </div>
            <g:clickableImage src="${assetPath(src: '/static/instructions/my/4.png')}" classes="cursor-pointer shadow-lg custom-image-70 shadow rounded custom-margin-1p25rem-bot" onclick="showImagePopup('modalInstructionMy4')" id="instructionMy4" idModal="modalInstructionMy4"/>
            <div class="custom-warning-message">
                <h5 class="custom-font-weight-600">Зауваження щодо редагування паролю</h5>
                <ul>
                    <li class="ml-3">Має складатись більш ніж з чотирьох символів</li>
                    <li class="ml-3">Може складатись з літер, цифр і символів</li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>