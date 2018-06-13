<!doctype html>
<html>
<head>
    <title>О факультеті</title>
</head>
<body>
    <div class="row">
        <div class="col-12">
            <div class="row">
                <div class="col-12 text-center pb-3 text-uppercase custom-font-size-1p3 custom-font-weight-500">
                    КАФЕДРА СПЕЦІАЛІЗОВАНИХ КОМП’ЮТЕРНИХ СИСТЕМ
                </div>
            </div>
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active show px-2" data-toggle="tab" href="#departmentMainInfo">Загальна інформація</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-2" data-toggle="tab" href="#departmentState">Штат кафедри</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-2" data-toggle="tab" href="#departmentHistory">Історія кафедри</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-2" data-toggle="tab" href="#departmentScience">Наукова діяльність кафедри</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-2" data-toggle="tab" href="#departmentEducation">Навчальна діяльність кафедри</a>
                </li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade active show" id="departmentMainInfo">
                    <div class="row pt-3 pb-3">
                        <div class="col-4 text-center">
                            <img src="${assetPath(src:'site_logo.png')}" class="custom-image-70"/>
                        </div>
                        <div class="col-8">
                            <address>
                                <p class="pt-3 pb-3"><strong>адреса:</strong> к. 602, механічний корпус, вул. Набережна Перемоги, 40, Дніпро, Україна, 49005</p>
                                <hr/><p class="pt-3 pb-3"><strong>тел.:</strong> +38 (056) 753-57-26</p>
                                <hr/><p class="pt-3"><strong>e-mail:</strong> comp_sys@udhtu.edu.ua</p>
                            </address>
                        </div>
                    </div>
                    <div class="row p-3">
                        <div class="col-12">
                            <address>
                                <p class="pb-3">Кафедра готує фахівців за ступенем <strong>бакалавра</strong> та  <strong>магістра</strong> за наступними галузями знань:</p>
                                <p class="pb-3"><strong>Галузь знань:</strong> 12 Інформаційні технології</p>
                                <p class="pb-3"><strong>Спеціальність:</strong> 123 Комп’ютерна інженерія</p>
                                <p class="pb-3"><strong>Освітня програма:</strong> <a href="#program" class="text-success" onclick="loadProgramPage()">Комп’ютерна інженерія (СКС)</a></p>
                            </address>
                        </div>
                    </div>
                    <div class="row pb-3">
                        <div class="col-auto mx-auto">
                            <div id="player"></div>
                        </div>
                    </div>

                    <script>
                        var player;
                        $(document).ready(function () {
                            var cb = () => {
                                player = new YT.Player('player', {
                                    height: '390',
                                    width: '640',
                                    videoId: 'zWKNAWYXLWU',
                                    events: {
                                        'onReady': onPlayerReady,
                                        'onStateChange': onPlayerStateChange
                                    }
                                });
                            }
                            function onPlayerReady(event) {
                                console.log('onPlayerReady');
                                // event.target.playVideo();
                            }
                            var done = false;

                            function onPlayerStateChange(event) {
                                if (event.data == YT.PlayerState.PLAYING && !done) {
                                    setTimeout(stopVideo, 6000);
                                    done = true;
                                }
                            }

                            function stopVideo() {
                                player.stopVideo();
                            }

                            if (!window.YT) {
                                $.getScript("https://www.youtube.com/iframe_api");
                                // update the global function to call cb
                                window.onYouTubeIframeAPIReady = cb;
                                // call cb()
                            } else {
                                window.onYouTubeIframeAPIReady = () => { }; // set it to dummy function
                                cb();
                            }
                        });
                    </script>
                    <div class="row px-3">
                        <div class="col-12">
                            <p class="pb-3">У 1996 році в Українському державному хіміко-технологічному університеті була сформована перша група студентів для отримання спеціальності “Спеціалізовані комп’ютерні системи”.</p>
                            <p class="pb-3">Після ряду реорганізацій у 2008 році на базі кафедри інформаційних технологій та кібернетики була створена кафедра спеціалізованих комп’ютерних систем, яка здійснює підготовку бакалаврів та магістрів за спеціальністю “Комп’ютерна інженерія” (денної та заочної форм навчання). У 2014 році кафедра СКС успішно пройшла чергову акредитацію бакалаврів, спеціалістів та магістрів та отримала відповідний сертифікат.</p>
                            <p class="pb-3">Студенти цієї спеціальності отримують фундаментальні знання з комп’ютерних технологій. Вони навчаються математичному моделюванню складних комп’ютерних систем, їх оптимізації, проектуванню сучасних комп’ютерних комплексів та мереж, розробляють їх програмне забезпечення, системи штучного інтелекту та робототехнічні системи.</p>
                            <p>
                                Освітньо-кваліфікаційний рівень:
                            </p>
                            <ul class="pb-3">
                                <li class="ml-3"><strong>бакалавр:</strong> фахівець з інформаційних технологій</li>
                                <li class="ml-3"><strong>магістр:</strong> аналітик комп’ютерних систем</li>
                            </ul>
                            <p class="pb-3">Сьогодні навчальний план дисциплін кафедри СКС відповідає навчальним планам кращих європейських університетів, що дає змогу студентам без перешкод продовжувати навчання в цих університетах.</p>
                            <p class="pb-3">Кафедра СКС приділяє велику увагу науково-дослідній роботі, що є суттєвою складовою підготовки майбутніх фахівців. Залучення студентів до участі у плануванні, виконанні та використанні результатів науково-дослідних робіт, починаючи з перших років навчання, надає можливість поступово заохочувати усіх до самостійного аналізу та пошуку оптимальних рішень при проектуванні сучасних комп’ютерних систем.</p>
                            <div class="row mb-3">
                                <div class="col">
                                    <g:clickableImage src="${assetPath(src:'/static/students/department/two.jpg')}" classes="cursor-pointer shadow-lg custom-image-70" onclick="showImagePopup('departmentTwoModal')" id="departmentTwo" idModal="departmentTwoModal"/>
                                </div>
                                <div class="col">
                                    <g:clickableImage src="${assetPath(src:'/static/students/department/three.jpg')}" classes="cursor-pointer shadow-lg custom-image-70" onclick="showImagePopup('departmentThreeModal')" id="departmentThree" idModal="departmentThreeModal"/>
                                </div>
                            </div>
                            <p class="pb-3">Навчальний процес на кафедрі забезпечують 10 науково-педагогічних працівників, у тому числі: 3 професора, 4 доцента, 2 старших викладача, 1 асистент.</p>
                            <p>Об’єкти професійної діяльності:</p>
                            <ul class="pb-3">
                                <li class="ml-3">комп’ютерні сиcтеми обчислювальних та інформаційних центрів, підприємств та організацій</li>
                                <li class="ml-3">математичне, інформаційне, технічне, програмне та організаційне забезпечення комп’ютерних систем</li>
                                <li class="ml-3">засоби та методи проектування, налагоджування та експлуатації комп’ютерних систем</li>
                                <li class="ml-3">технічне діагностування, наукові дослідження та виробничі випробування комп’ютерних систем</li>
                                <li class="ml-3">програмне забезпечення комп’ютерних мереж та вбудованих комп’ютерних систем</li>
                            </ul>
                            <p class="pb-3">Для забезпечення високої професійної підготовки розвивається матеріальне забезпечення кафедри. Кафедра має два комп’ютерних класи для студентів та один для викладачів кафедри. Завдяки висококваліфікованому професорсько-викладацькому складу та допоміжному персоналу створено спеціалізовану лабораторію з мікропроцесорної техніки, яка обладнана учбово-лабораторними стендами “EV8031/AVR”, “LOGIC”, “OpAmp”, “Trigger”.</p>
                            <div class="row mb-3">
                                <div class="col">
                                    <g:clickableImage src="${assetPath(src:'/static/students/department/four.jpg')}" classes="cursor-pointer shadow-lg custom-image-50" onclick="showImagePopup('departmentFourModal')" id="departmentFour" idModal="departmentFourModal"/>
                                </div>
                            </div>
                            <p class="pb-3">Лабораторія та комп’ютерні класи обладнані сучасною комп’ютерною технікою, вимірювальними приладами, навчальними дослідницькими стендами та іншим необхідним устаткуванням, що дозволяє студентам та співробітникам кафедри СКС ефективно займатися науково-практичною діяльністю. Комп’ютери в учбових класах кафедри та викладацьких об’єднані в локальну мережу та мають вихід до всесвітньої мережі Internet. Для кращого засвоєння матеріалу на лекціях та практичних заняттях успішно застосовуються наочні засоби навчання.</p>
                            <div class="row mb-3">
                                <div class="col">
                                    <g:clickableImage src="${assetPath(src:'/static/students/department/five.jpg')}" classes="cursor-pointer shadow-lg custom-image-70" onclick="showImagePopup('departmentFiveModal')" id="departmentFive" idModal="departmentFiveModal"/>
                                </div>
                                <div class="col">
                                    <g:clickableImage src="${assetPath(src:'/static/students/department/six.jpg')}" classes="cursor-pointer shadow-lg custom-image-70" onclick="showImagePopup('departmentSixModal')" id="departmentSix" idModal="departmentSixModal"/>
                                </div>
                            </div>
                            <p>Після одержання спеціальності працевлаштування можливе в таких сферах</p>
                            <ul class="pb-3">
                                <li class="ml-3">проектування сучасних комп’ютерних комплексів, систем та мереж</li>
                                <li class="ml-3">розробка програмного забезпечення</li>
                                <li class="ml-3">технічна діагностика з застосуванням сучасних засобів на базі комп’ютерів</li>
                                <li class="ml-3">монтаж, налагодження та регулювання засобів обчислювальної техніки</li>
                                <li class="ml-3">робота з базами даних</li>
                                <li class="ml-3">робототехніка</li>
                            </ul>
                            <p class="pb-3">Уперше випуск спеціалістів зі спеціальності “Спеціалізовані комп’ютерні системи” відбувся у 2003 р. Починаючи з 2003 і весь подальший період  керівництво і професорсько-викладацький склад здійснюють значну роботу по підвищенню якості спеціалістів і їхньому працевлаштуванню.</p>
                            <div class="row mb-3">
                                <div class="col">
                                    <g:clickableImage src="${assetPath(src:'/static/students/department/seven.jpg')}" classes="cursor-pointer shadow-lg custom-image-70" onclick="showImagePopup('departmentSevenModal')" id="departmentSeven" idModal="departmentSevenModal"/>
                                </div>
                                <div class="col">
                                    <g:clickableImage src="${assetPath(src:'/static/students/department/eight.jpg')}" classes="cursor-pointer shadow-lg custom-image-70" onclick="showImagePopup('departmentEightModal')" id="departmentEight" idModal="departmentEightModal"/>
                                </div>
                            </div>
                            <p class="pb-3">Дбайливе відношення і професійність викладання, що сприяють якісній підготовці студентів, реклама спеціальностей і спеціалізації забезпечили практично 100-відсоткове працевлаштування випускників кафедри, більшість з яких направляється по запитам підприємств, таких як Інститут технічної механіки НАНУ і ДКАУ, Головне Управління Державного казначейства України в Дніпропетровській області, Південний машинобудівний завод, ВАТ «Український мобільний зв’язок», КБ «Приватбанк», «Укрсіббанк». Багато студентів та випускників працевлаштувались в українських та міжнародних компаніях, що спеціалізуються на розробці програмного забезпечення.</p>
                            <p class="pb-3">Окрім потужних знань УДХТУ дає можливість для реалізації талантів студентів.</p>
                            <p class="pb-3">Вони приймають участь у щорічному конкурсі талантів «Студентська весна»:</p>
                            <div class="row mb-3">
                                <div class="col">
                                    <g:clickableImage src="${assetPath(src:'/static/students/department/nine.jpg')}" classes="cursor-pointer shadow-lg custom-image-70" onclick="showImagePopup('departmentNineModal')" id="departmentNine" idModal="departmentNineModal"/>
                                </div>
                                <div class="col">
                                    <g:clickableImage src="${assetPath(src:'/static/students/department/ten.jpg')}" classes="cursor-pointer shadow-lg custom-image-70" onclick="showImagePopup('departmentTenModal')" id="departmentTen" idModal="departmentTenModal"/>
                                </div>
                            </div>
                            <p class="pb-3">Вміють і посміятися, і насмішити:</p>
                            <div class="row mb-3">
                                <div class="col">
                                    <g:clickableImage src="${assetPath(src:'/static/students/department/eleven.jpg')}" classes="cursor-pointer shadow-lg custom-image-70" onclick="showImagePopup('departmentElevenModal')" id="departmentEleven" idModal="departmentElevenModal"/>
                                </div>
                                <div class="col">
                                    <g:clickableImage src="${assetPath(src:'/static/students/department/twelve.jpg')}" classes="cursor-pointer shadow-lg custom-image-70" onclick="showImagePopup('departmentTwelveModal')" id="departmentTwelve" idModal="departmentTwelveModal"/>
                                </div>
                            </div>
                            <p class="pb-3">А ось наша красуня змагається у конкурсі краси «Місс УДХТУ»:</p>
                            <div class="row mb-3">
                                <div class="col">
                                    <g:clickableImage src="${assetPath(src:'/static/students/department/thirteen.jpg')}" classes="cursor-pointer shadow-lg custom-image-70" onclick="showImagePopup('departmentThirteenModal')" id="departmentThirteen" idModal="departmentThirteenModal"/>
                                </div>
                                <div class="col">
                                    <g:clickableImage src="${assetPath(src:'/static/students/department/fourteen.jpg')}" classes="cursor-pointer shadow-lg custom-image-70" onclick="showImagePopup('departmentFourteenModal')" id="departmentFourteen" idModal="departmentFourteenModal"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="departmentState">
                    <div class="row py-3">
                        <div class="col-12">
                            <div class="row">
                                <div class="col-4">
                                    <g:clickableImage src="${assetPath(src: '/static/students/department/stuff/kosolap.jpg')}" classes="cursor-pointer shadow-lg custom-image-100" onclick="showImagePopup('modalStuffKosolap')" id="stuffKosolap" idModal="modalStuffKosolap"/>
                                </div>
                                <div class="col-8">
                                    <h4 class="pb-2">Косолап Анатолій Іванович</h4>
                                    <address class="text-muted pb-3">
                                        <p class="pb-1">завідувач кафедри СКС</p>
                                        <p class="pb-1">доктор фізико-математичних наук (спеціальність 01.05.02 – математичне моделювання та обчислювальні методи)</p>
                                        <p class="pb-1">професор (2014 р.)</p>
                                    </address>
                                    <p class="pb-3">Тема докторської дисертації: <em>«Розробка детермінованих моделей та методів глобальної оптимізації з використанням опуклості» (2012 р.).</em></p>
                                    <p class="pb-3"><strong>Базова освіта:</strong> Дніпропетровський державний університет (нині Дніпропетровський Національний університет ім. О. Гончара), механіко-математичний факультет, кваліфікація – «математик, викладач математики» (1969 р.).</p>
                                    <p>Дисципліни, що викладає:</p>
                                    <ul class="pb-3">
                                        <li class="ml-3 text-lowercase">Системне програмне забезпечення</li>
                                        <li class="ml-3 text-lowercase">Системний аналіз</li>
                                        <li class="ml-3 text-lowercase">Internet-технології</li>
                                        <li class="ml-3 text-lowercase">Ефективність та надійність технічних систем</li>
                                    </ul>
                                    <p class="pb-3">Наукові інтереси: моделювання складних систем та їх оптимізація, розробка програмного забезпечення</p>
                                    <p class="pb-3">Публікації: опублікував понад 150 наукових робіт в області оптимізації, у тому числі 4 монографії, 5 навчальних посібників. Профіль <a target="_blank" href="https://scholar.google.com.ua/citations?user=OoyQrP8AAAAJ&hl=ru">Google Scholar</a></p>
                                    <p class="pb-3">Керівництво аспірантами і докторантами: є керівником 2-х аспірантів, підготував одного кандидата наук.</p>
                                    <p class="pb-3">А.І. Косолап – фахівець в області математичного моделювання та оптимізації складних систем. Розробив пакет прикладних програм Excel_SP для моделювання та оптимізації складних систем, а також десятки інших програм для розв’язання оптимізаційних задач.</p>
                                    <p class="pb-3">Брав участь як доповідач у більше ніж 30 міжнародних конференціях, у тому числі міжнародних наукових форумах по оптимізації в Німеччині (Ремаген, 2009 р.) та Франції (Тулуза, 2010 р., 2013 р.) та ін.</p>
                                    <p class="pb-3">В області оптимізації складних систем розробив декілька нових напрямків досліджень. Проаналізував світові досягнення в області оптимізації і розвинув далі опуклий аналіз, теорію і методи напіввизначеної оптимізації, негладкої оптимізації, детерміновану глобальну оптимізацію, які знаходять широке застосування в оптимальному проектуванні, штучному інтелекті, економіці, виконанні складних проектів, розпізнаванні образів, хімії та багатьох інших прикладних областях. Розробив нові ефективні методи для розв’язання цих класів задач.</p>
                                    <p class="pb-3">А.І. Косолап є членом Європейського наукового товариства з безперервною оптимізації – «EUROPT» і міжнародного наукового товариства – «Mathematical Optimization Society».</p>
                                </div>
                            </div>
                            <hr class="mb-4 mt-1 custom-divider"/>
                            <div class="row">
                                <div class="col-4">
                                    <g:clickableImage src="${assetPath(src: '/static/students/department/stuff/alpatov.jpg')}" classes="cursor-pointer shadow-lg custom-image-100" onclick="showImagePopup('modalStuffAlpatov')" id="stuffAlpatov" idModal="modalStuffAlpatov"/>
                                </div>
                                <div class="col-8">
                                    <h4 class="pb-2">Алпатов Анатолій Петрович</h4>
                                    <address class="text-muted pb-3">
                                        <p class="pb-1">доктор технічних наук (1968 р.)</p>
                                        <p class="pb-1">професор</p>
                                    </address>
                                    <p class="pb-3"><strong>Базова освіта:</strong> Казанський авіаційний інститут, спеціальність – «динаміка польоту та управління», кваліфікація – «інженер-механік» (1965 р.).</p>
                                    <p>Дисципліни, що викладає:</p>
                                    <ul class="pb-3">
                                        <li class="ml-3 text-lowercase">Цифрова обробка сигналів та зображень</li>
                                        <li class="ml-3 text-lowercase">Проектування комп’ютерних систем діагностики технічних комплексів</li>
                                        <li class="ml-3 text-lowercase">Комп’ютерний контроль та аналіз сигналів</li>
                                    </ul>
                                    <p class="pb-3">Публікації: є автором і співавтором 260 наукових публікацій, 15 монографій, 30 винаходів.</p>
                                    <p class="pb-3">А.П. Алпатов – доктор технічних наук, професор, член-кореспондент Міжнародної академії астронавтики, Заслужений діяч науки і техніки України, почесний професор Харбінського політехнічного університету (Китай).</p>
                                    <p class="pb-3">Був членом секції Наукової ради АН СРСР з проблем управління рухом і навігації, членом Національного комітету Української асоціації автоматичного управління IFAC. В даний час є членом Міжнародного комітету з проблем засмічення космічного простору. Входив до складу експертної ради Вищої атестаційної комісії України. Член редколегій низки наукових журналів. В даний час керує відділом системного аналізу і проблем управління Інституту технічної механіки Національної академії наук України та Державного космічного агентства України.</p>
                                    <p class="pb-3">Основний напрямок фундаментальних досліджень пов’язаний з розробкою теорії і методів моделювання руху складних механічних систем в умовах космічного простору. Розробив теорію рухомого управління космічними літальними апаратами, математичні моделі динаміки просторово-розвинених механічних систем з пружними зв’язками, включаючи маніпуляційні системи, космічні тросові системи і сонячні електростанції космічного базування.</p>
                                    <p class="pb-3">Велику увагу приділяє педагогічній роботі. Був професором Дніпропетровського державного університету, завідувачем кафедри медичної кібернетики, створеної ним в Дніпропетровському медичному інституті. В даний час є професором кафедри спеціалізованих комп’ютерних систем ДВНЗ «Український державний хіміко-технологічний університет».</p>
                                    <p class="pb-3">Підготував 3 докторів та 9 кандидатів наук.</p>
                                </div>
                            </div>
                            <hr class="mb-4 mt-1 custom-divider"/>
                            <div class="row">
                                <div class="col-4">
                                    <g:clickableImage src="${assetPath(src: '/static/students/department/stuff/horoshilov.jpg')}" classes="cursor-pointer shadow-lg custom-image-100" onclick="showImagePopup('modalStuffHoroshilov')" id="stuffHoroshilov" idModal="modalStuffHoroshilov"/>
                                </div>
                                <div class="col-8">
                                    <h4 class="pb-2">Хорошилов Сергій Вікторович</h4>
                                    <address class="text-muted pb-3">
                                        <p class="pb-1">доктор технічних наук (спеціальність 05.13.03 – системи та процеси керування)</p>
                                        <p class="pb-1">професор</p>
                                    </address>
                                    <p class="pb-3">Тема докторської дисертації: <em>«Методологічні основи керування орієнтацією сонячних електростанцій космічного базування» (2013 р.).</em></p>
                                    <p class="pb-3"><strong>Базова освіта:</strong> Дніпропетровський державний університет, фізико-технічний факультет, спеціальність — «керування в технічних системах», кваліфікація — «інженер» (1995 р.).</p>
                                    <p>Дисципліни, що викладає:</p>
                                    <ul class="pb-3">
                                        <li class="ml-3 text-lowercase">Інженерія програмного забезпечення</li>
                                        <li class="ml-3 text-lowercase">Експертні системи</li>
                                        <li class="ml-3 text-lowercase">Системи штучного інтелекту</li>
                                        <li class="ml-3 text-lowercase">Інструментальні засоби розробки мережевих додатків</li>
                                        <li class="ml-3 text-lowercase">Технології розробки комп’ютерних систем</li>
                                    </ul>
                                    <p class="pb-3">Наукові інтереси: Динаміка і управління космічними апаратами; управління великими космічними конструкціями; теорія адаптивного і робастного управління; проблема космічного сміття.</p>
                                    <p class="pb-3">Публікації: опублікував понад 70 наукових робіт, серед яких 2 монографії.</p>
                                    <p class="pb-3">С.В. Хорошилов – провідний науковий співробітник відділу системного аналізу та проблем управління Інституту технічної механіки з 20-и річним досвідом роботи в галузі динаміки космічних систем і передових технологій. Результати його робіт відзначені нагородами Президента України, Національної академії наук України та Державного космічного агентства України. Розроблені ним математичні моделі, методи, методики і алгоритми використовувалися ДП «КБ «Південне» при розробці ряду космічних місій. С.В. Хорошилов – постійний експерт ДКАУ в складі Міжагентського координаційного комітету з проблеми космічного сміття.</p>
                                </div>
                            </div>
                            <hr class="mb-4 mt-1 custom-divider"/>
                            <div class="row">
                                <div class="col-4">
                                    <g:clickableImage src="${assetPath(src: '/static/students/department/stuff/kapitonov.jpg')}" classes="cursor-pointer shadow-lg custom-image-100" onclick="showImagePopup('modalStuffKapitonov')" id="stuffKapitonov" idModal="modalStuffKapitonov"/>
                                </div>
                                <div class="col-8">
                                    <h4 class="pb-2">Капітонов Олександр Георгійович</h4>
                                    <address class="text-muted pb-3">
                                        <p class="pb-1">кандидат хімічних наук (спеціальність 02.00.05 – електрохімія)</p>
                                        <p class="pb-1">доцент (2012 р.)</p>
                                    </address>
                                    <p class="pb-3">Тема кандидатської дисертації: <em>«Урахування елементу сталої фази в релаксаційних електрохімічних вимірюваннях» (1996 р.).</em></p>
                                    <p class="pb-3"><strong>Базова освіта:</strong> Дніпропетровський державний університет (нині Дніпропетровський Національний університет ім. О. Гончара), кваліфікація – «фізик, викладач фізики» (1976 р.).</p>
                                    <p>Дисципліни, що викладає:</p>
                                    <ul class="pb-3">
                                        <li class="ml-3 text-lowercase">Системне програмування</li>
                                        <li class="ml-3 text-lowercase">Периферійні пристрої</li>
                                        <li class="ml-3 text-lowercase">Комп’ютерні системи</li>
                                        <li class="ml-3 text-lowercase">Дослідження та проектування спеціалізованих комп’ютерних систем</li>
                                        <li class="ml-3 text-lowercase">Дослідження та проектування вбудованих комп’ютерних систем</li>
                                    </ul>
                                    <p class="pb-3">Наукові інтереси: математичне моделювання процесів фазоутворення.</p>
                                    <p class="pb-3">Публікації: понад 40 наукових робіт. Профіль <a target="_blank" href="https://scholar.google.com.ua/citations?user=Nb-ePQMAAAAJ&hl=ru">Google Scholar</a></p>
                                </div>
                            </div>
                            <hr class="mb-4 mt-1 custom-divider"/>
                            <div class="row">
                                <div class="col-4">
                                    <g:clickableImage src="${assetPath(src: '/static/students/department/stuff/bileckiy.jpg')}" classes="cursor-pointer shadow-lg custom-image-100" onclick="showImagePopup('modalStuffBileckiy')" id="stuffBileckiy" idModal="modalStuffBileckiy"/>
                                </div>
                                <div class="col-8">
                                    <h4 class="pb-2">Білецький Олександр Семенович</h4>
                                    <address class="text-muted pb-3">
                                        <p class="pb-1">кандидат технічних наук (спеціальність 05.07.05 – теплові двигуни летальних апаратів)</p>
                                        <p class="pb-1">доцент (2012 р.)</p>
                                    </address>
                                    <p class="pb-3">Тема кандидатської дисертації: <em>спецтема (1986 р.).</em></p>
                                    <p class="pb-3"><strong>Базова освіта:</strong> Дніпропетровський державний університет (нині Дніпропетровський Національний університет ім. О. Гончара), фізико-технічний факультет, спеціальність – «двигуни літальних апаратів», кваліфікація – «інженер-механік» (1978 р.).</p>
                                    <p>Дисципліни, що викладає:</p>
                                    <ul class="pb-3">
                                        <li class="ml-3">архітектура ЕОМ</li>
                                        <li class="ml-3">комп’ютерна схемотехніка та архітектура ЕОМ</li>
                                        <li class="ml-3 text-lowercase">Теорія інформації та кодування</li>
                                        <li class="ml-3 text-lowercase">Теорія автоматичного керування</li>
                                        <li class="ml-3 text-lowercase">Технології розподілених систем та паралельних обчислень</li>
                                        <li class="ml-3 text-lowercase">Паралельні та розподілені обчислення</li>
                                    </ul>
                                    <p class="pb-3">Наукові інтереси: динаміка енергетичних установок та складних гідромеханічних систем.</p>
                                    <p class="pb-3">Публікації: більше 50 наукових робіт, 1 винахід. Профіль <a target="_blank" href="https://scholar.google.com.ua/citations?user=mSjDpOMAAAAJ&hl=ru">Google Scholar</a></p>
                                </div>
                            </div>
                            <hr class="mb-4 mt-1 custom-divider"/>
                            <div class="row">
                                <div class="col-4">
                                    <g:clickableImage src="${assetPath(src: '/static/students/department/stuff/sergeeva.jpg')}" classes="cursor-pointer shadow-lg custom-image-100" onclick="showImagePopup('modalStuffSergeeva')" id="stuffSergeeva" idModal="modalStuffSergeeva"/>
                                </div>
                                <div class="col-8">
                                    <h4 class="pb-2">Сергєєва Ольга В’ячеславівна</h4>
                                    <address class="text-muted pb-3">
                                        <p class="pb-1">кандидат технічних наук (спеціальність 05.17.01 – технологія неорганічних речовин)</p>
                                        <p class="pb-1">доцент (2011 р.)</p>
                                    </address>
                                    <p class="pb-3">Тема кандидатської дисертації: <em>«Технологія плазмохімічного рідкофазного вилучення іонів полівалентних металів з відходів гальванічних та травильних виробництв» (2004 р.).</em></p>
                                    <p class="pb-3"><strong>Базова освіта:</strong> Український державний хіміко-технологічний університет, спеціальність – «хімічне машинобудування та апаратобудування», кваліфікація – «інженер-механік» (1995 р.); Дніпропетровський державний університет, спеціальність – «інформаційні системи в менеджменті», кваліфікація – «інженер-економіст» (1996 р.).</p>
                                    <p>Дисципліни, що викладає:</p>
                                    <ul class="pb-3">
                                        <li class="ml-3 text-lowercase">Комп’ютерна схемотехніка</li>
                                        <li class="ml-3 text-lowercase">Електронно-обчислювальні машини і мікропроцесорні системи</li>
                                        <li class="ml-3 text-lowercase">Проектування мікропроцесорних систем</li>
                                        <li class="ml-3 text-lowercase">Комп’ютерний моніторинг хімічних виробництв</li>
                                    </ul>
                                    <p class="pb-3">Наукові інтереси: моделювання плазмохімічних процесів обробки рідких середовищ.</p>
                                    <p class="pb-3">Публікації: 71 друкована праця, з яких 35 – це статті у фахових виданнях України та 6 – це статті у міжнародних виданнях.</p>
                                    <p class="pb-3">Профіль <a target="_blank" href="https://scholar.google.com.ua/citations?user=o3kLHeIAAAAJ&hl=ru">Google Scholar</a></p>
                                </div>
                            </div>
                            <hr class="mb-4 mt-1 custom-divider"/>
                            <div class="row">
                                <div class="col-4">
                                    <g:clickableImage src="${assetPath(src: '/static/students/department/stuff/peretyatko.jpg')}" classes="cursor-pointer shadow-lg custom-image-100" onclick="showImagePopup('modalStuffPeretyatko')" id="stuffPeretyatko" idModal="modalStuffPeretyatko"/>
                                </div>
                                <div class="col-8">
                                    <h4 class="pb-2">Перетятько Анастасія Сергіївна</h4>
                                    <address class="text-muted pb-3">
                                        <p class="pb-1">кандидат фізико-математичних наук (спеціальність 01.05.02 – математичне моделювання та обчислювальні методи)</p>
                                        <p class="pb-1">доцент</p>
                                    </address>
                                    <p class="pb-3">Тема кандидатської дисертації: <em>«Напіввизначена оптимізація для розв’язування загальних квадратичних задач» (2015 р.).</em></p>
                                    <p class="pb-3"><strong>Базова освіта:</strong> Дніпропетровський національний університет імені Олеся Гончара, факультет прикладної математики, спеціальність – «інформатика», кваліфікація – «магістр інформатики» (2010 р.).</p>
                                    <p>Дисципліни, що викладає:</p>
                                    <ul class="pb-3">
                                        <li class="ml-3 text-lowercase">Стандарти розробки програмного забезпечення</li>
                                        <li class="ml-3 text-lowercase">Системне програмне забезпечення</li>
                                        <li class="ml-3 text-lowercase">Інженерія програмного забезпечення</li>
                                        <li class="ml-3">програмування на мові VBA</li>
                                        <li class="ml-3">програмування на мові Java</li>
                                        <li class="ml-3 text-lowercase">Периферійні пристрої</li>
                                        <li class="ml-3 text-lowercase">Комп’ютерні системи</li>
                                        <li class="ml-3 text-lowercase">Експертні системи</li>
                                        <li class="ml-3 text-lowercase">Системне програмування</li>
                                        <li class="ml-3 text-lowercase">Комп’ютерні технології в діловодстві</li>
                                    </ul>
                                    <p class="pb-3">Наукові інтереси: методи глобальної оптимізації, напіввизначена оптимізація.</p>
                                    <p class="pb-3">Публікації: більше 30 статей та тез доповідей.</p>
                                    <p class="pb-3">Профіль <a target="_blank" href="https://scholar.google.com.ua/citations?user=bjtK8CIAAAAJ&hl=ru">Google Scholar</a></p>
                                </div>
                            </div>
                            <hr class="mb-4 mt-1 custom-divider"/>
                            <div class="row">
                                <div class="col-4">
                                    <g:clickableImage src="${assetPath(src: '/static/students/department/stuff/brazinskaya.jpg')}" classes="cursor-pointer shadow-lg custom-image-100" onclick="showImagePopup('modalStuffBrazinskaya')" id="stuffBrazinskaya" idModal="modalStuffBrazinskaya"/>
                                </div>
                                <div class="col-8">
                                    <h4 class="pb-2">Бразинська Світлана Вікторівна</h4>
                                    <address class="text-muted pb-3">
                                        <p class="pb-1">старший викладач</p>
                                        <p class="pb-1">вчений секретар кафедри СКС</p>
                                    </address>
                                    <p class="pb-3"><strong>Базова освіта:</strong> Дніпропетровський державний університет (нині Дніпропетровський Національний університет ім. О. Гончара), механіко-математичний факультет, спеціальність – «гідроаеродинаміка», кваліфікація – «механік» (1979 р.).</p>
                                    <p>Дисципліни, що викладає: </p>
                                    <ul class="pb-3">
                                        <li class="ml-3 text-lowercase">Комп’ютерна логіка</li>
                                        <li class="ml-3 text-lowercase">Дискретна математика</li>
                                        <li class="ml-3 text-lowercase">Автоматизація проектування комп’ютерних систем</li>
                                    </ul>
                                    <p class="pb-3">Наукові інтереси: дистанційна освіта, СДО Moodle.</p>
                                    <p class="pb-3">Публікації: 15 наукових публікацій, 46 методичних вказівок. </p>
                                    <p class="pb-3">Профіль <a target="_blank" href="https://scholar.google.com.ua/citations?user=4NUkQhoAAAAJ&hl=ru">Google Scholar</a></p>
                                </div>
                            </div>
                            <hr class="mb-4 mt-1 custom-divider"/>
                            <div class="row">
                                <div class="col-4">
                                    <g:clickableImage src="${assetPath(src: '/static/students/department/stuff/dubovik.jpg')}" classes="cursor-pointer shadow-lg custom-image-100" onclick="showImagePopup('modalStuffDubovik')" id="stuffDubovik" idModal="modalStuffDubovik"/>
                                </div>
                                <div class="col-8">
                                    <h4 class="pb-2">Дубовик Тетяна Миколаївна</h4>
                                    <address class="text-muted pb-3">
                                        <p class="pb-1">старший викладач</p>
                                    </address>
                                    <p class="pb-3"><strong>Базова освіта:</strong> Український державний хіміко-технологічний університет, спеціальність – «Автоматизоване управління технологічними процесами», кваліфікація – «фахівець з автоматизації та комп’ютерно-інтегрованих технологій» (2001 р.).</p>
                                    <p>Дисципліни, що викладає:</p>
                                    <ul class="pb-3">
                                        <li class="ml-3 text-lowercase">Комп’ютерна електроніка</li>
                                        <li class="ml-3 text-lowercase">Робототехніка</li>
                                        <li class="ml-3">ЕОМ та мікропроцесорні системи</li>
                                        <li class="ml-3 text-lowercase">Комп’ютерна схемотехніка</li>
                                        <li class="ml-3 text-lowercase">Комп’ютерні технології в діловодстві</li>
                                        <li class="ml-3 text-lowercase">Методи та засоби комп’ютерно-інтегрованих технологій</li>
                                        <li class="ml-3 text-lowercase">Цифрова обробка сигналів та зображень</li>
                                        <li class="ml-3 text-lowercase">Проектування комп’ютерних систем діагностики технічних комплексів</li>
                                        <li class="ml-3 text-lowercase">Комп’ютерний контроль та аналіз сигналів</li>
                                        <li class="ml-3 text-lowercase">Експертні системи</li>
                                        <li class="ml-3 text-lowercase">Інженерія програмного забезпечення</li>
                                    </ul>
                                    <p class="pb-3">Наукові інтереси: розробка інформаційних технологій підвищення ефективності підготовки ІТ-спеціалістів.</p>
                                    <p class="pb-3">Публікації: 39 публікацій (з них 6 статей в журналах з переліку ВАК), 20 методичних вказівок.</p>
                                    <p class="pb-3">Профіль <a target="_blank" href="https://scholar.google.com.ua/citations?user=bpkAfyQAAAAJ&hl=uk">Google Scholar</a></p>
                                </div>
                            </div>
                            <hr class="mb-4 mt-1 custom-divider"/>
                            <div class="row">
                                <div class="col-4">
                                    <g:clickableImage src="${assetPath(src: '/static/students/department/stuff/dovgopola.jpg')}" classes="cursor-pointer shadow-lg custom-image-100" onclick="showImagePopup('modalStuffDovgopola')" id="stuffDovgopola" idModal="modalStuffDovgopola"/>
                                </div>
                                <div class="col-8">
                                    <h4 class="pb-2">Довгопола Альона Олександрівна</h4>
                                    <address class="text-muted pb-3">
                                        <p class="pb-1">асистент</p>
                                    </address>
                                    <p class="pb-3">Тема кандидатської дисертації: <em>«Математичне моделювання та розв’язок багатоекстремальних задач методом точної квадратичної регуляризації».</em></p>
                                    <p class="pb-3"><strong>Базова освіта:</strong> Український державний хіміко-технологічний університет, спеціальність – «метрологія» (2013 р.).</p>
                                    <p>Дисципліни, що викладає:</p>
                                    <ul class="pb-3">
                                        <li class="ml-3 text-lowercase">Системний аналіз</li>
                                        <li class="ml-3 text-lowercase">Ефективність та надійність технічних систем</li>
                                        <li class="ml-3 text-lowercase">Системне програмне забезпечення</li>
                                        <li class="ml-3 text-lowercase">Інженерія програмного забезпечення</li>
                                        <li class="ml-3 text-lowercase">теорія інформації та кодування</li>
                                        <li class="ml-3">архітектура ЕОМ</li>
                                    </ul>
                                    <p class="pb-3">Наукові інтереси: методи глобальної оптимізації, метрологія.</p>
                                    <p class="pb-3">Публікації: більше 10 наукових робіт.</p>
                                    <p class="pb-3">Профіль <a target="_blank" href="https://scholar.google.com.ua/citations?user=sMxxxy0AAAAJ&hl=ru">Google Scholar</a></p>
                                </div>
                            </div>
                            <hr class="mb-4 mt-1 custom-divider"/>
                            <div class="row">
                                <div class="col-4">
                                    <g:clickableImage src="${assetPath(src: '/static/students/department/stuff/penya.jpg')}" classes="cursor-pointer shadow-lg custom-image-100" onclick="showImagePopup('modalStuffPenya')" id="stuffPenya" idModal="modalStuffPenya"/>
                                </div>
                                <div class="col-8">
                                    <h4 class="pb-2">Пеня Тетяна Дмитрівна</h4>
                                    <address class="text-muted pb-3">
                                        <p class="pb-1">інженер І категорії</p>
                                    </address>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="departmentHistory">
                    <div class="row px-3 py-4">
                        <div class="col-12">
                            <p class="pb-3">Перша група студентів для отримання в Українському державному хіміко-технологічному університеті спеціальності “Спеціалізовані комп’ютерні системи” була прийнята у 1996 році.</p>
                            <p class="pb-3">Особливості підготовки фахівців з цієї спеціальності викликали потребу в створенні окремої кафедри. Тому в 1999 році на механічному факультеті УДХТУ на базі кафедри обчислювальної техніки та прикладної математики за ініціативою кандидата фізико-математичних наук, доцента Миколи Феодосійовича Огданського та професора Юрія Івановича Мережка була створена кафедра інформаційних технологій та кібернетики. Кафедру очолив кандидат фізико-математичних наук, доцент М.Ф. Огданський.</p>
                            <p class="pb-3">Кафедра отримала ліцензії на підготовку спеціалістів за спеціальністю “Економічна кібернетика“, “Спеціалізовані комп’ютерні системи” та “Інформаційні управляючі системи і технології“. В роки становлення вченим секретарем кафедри був кандидат технічних наук Євген Миколайович Логачов, а з 2002 року – старший викладач Світлана Вікторівна Бразинська.</p>
                            <p class="pb-3">У 2002-2003 роках усі спеціальності було акредитовано за освітньо-кваліфікаційним рівнем “спеціаліст”. У 2003 році кафедра здобула ліцензію на підготовку магістрів за спеціальністю “Спеціалізовані комп’ютерні системи“.</p>
                            <p class="pb-3">Активну участь в організації роботи кафедри приймали заступники завідувача кафедри, кандидат фізико-математичних наук Сергій Михайлович Заблуда (2002-2006) і кандидат хімічних наук Олександр Георгійович Капітонов (2006-2009).</p>
                            <p class="pb-3">До навчального процесу були залучені професори Е.В. Кочура, А.І. Федякін, Г.С. Пашковський, В.П. Пошивалов, В.М. Корчинсьий, О.І. Міхальов</p>
                            <p class="pb-3">З 2005 року естафету по розвитку спеціальності прийняв доктор технічних наук, професор Алпатов Анатолій Петрович, завідувач відділу системного аналізу та проблем управління Інституту технічної механіки Національної академії наук України і Національного космічного агентства України, керівник секції інформатики Придніпровського наукового центру Національної академії наук України і Міністерства освіти і науки України, засновник кафедри медичної кібернетики та обчислювальної техніки Дніпропетровської державної медичної академії.</p>
                            <p class="pb-3">У 2008 році на базі кафедри інформаційних технологій та кібернетики була створена кафедра спеціалізованих комп’ютерних систем, яка здійснює підготовку бакалаврів, спеціалістів та магістрів фахового напряму “Комп’ютерна інженерія” за спеціальністю “Спеціалізовані комп’ютерні системи“. В 2014 році кафедра СКС успішно пройшла чергову акредитацію бакалаврів, спеціалістів та магістрів та отримала відповідний сертифікат.</p>
                            <p class="pb-3">З 2010 року по 2014 кафедру СКС очолював доктор технічних наук, старший науковий співробітник Чумаков Лев Дмитрович. Він мав великий досвід роботи в організаціях Національної академії наук України та промисловості.</p>
                            <p class="pb-3">З листопада 2015 року кафедру очолює доктор фізико-математичних наук, професор Анатолій Іванович Косолап. Він та його учні ведуть активну наукову роботу в галузі математичного моделювання та оптимізації складних систем. Отримані наукові результати знайшли відображення в 4-х монографіях, в яких пропонуються нові методи оптимізації складних систем, а також значна увага приділяється розробці ефективного програмного забезпечення. А.І. Косолап був учасником більше 40 міжнародних наукових конференцій, як в Україні так і за її межами, де він доповідав нові наукові результати та обмінювався досвідом впровадження цих результатів в навчальний процес. Він є членом European Operational Research Societies. Значну увагу А.І. Косолап приділяє якості навчання та його відповідності кращим європейським та національним університетам.  Кожен випускник кафедри повинен оволодіти сучасними методами моделювання складних комп’ютерних систем, оптимізувати їх структуру та функціонування за допомогою сучасного програмного забезпечення.</p>
                            <div class="row mb-5">
                                <div class="col">
                                    <g:clickableImage src="${assetPath(src: '/static/students/department/history/1.jpg')}" classes="cursor-pointer shadow-lg custom-image-70" onclick="showImagePopup('modalHistory1')" id="history1" idModal="modalHistory1"/>
                                </div>
                                <div class="col">
                                    <g:clickableImage src="${assetPath(src: '/static/students/department/history/2.jpg')}" classes="cursor-pointer shadow-lg custom-image-70" onclick="showImagePopup('modalHistory2')" id="history2" idModal="modalHistory2"/>
                                </div>
                                <div class="col">
                                    <g:clickableImage src="${assetPath(src: '/static/students/department/history/3.jpg')}" classes="cursor-pointer shadow-lg custom-image-70" onclick="showImagePopup('modalHistory3')" id="history3" idModal="modalHistory3"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <g:clickableImage src="${assetPath(src: '/static/students/department/history/4.jpg')}" classes="cursor-pointer shadow-lg custom-image-70" onclick="showImagePopup('modalHistory4')" id="history4" idModal="modalHistory4"/>
                                </div>
                                <div class="col">
                                    <g:clickableImage src="${assetPath(src: '/static/students/department/history/5.jpg')}" classes="cursor-pointer shadow-lg custom-image-70" onclick="showImagePopup('modalHistory5')" id="history5" idModal="modalHistory5"/>
                                </div>
                                <div class="col">
                                    <g:clickableImage src="${assetPath(src: '/static/students/department/history/6.jpg')}" classes="cursor-pointer shadow-lg custom-image-70" onclick="showImagePopup('modalHistory6')" id="history6" idModal="modalHistory6"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="departmentScience">
                    <div class="row px-3 py-4">
                        <div class="col-12">
                            <p>З 2016 року на кафедрі СКС відкрита аспірантура по спеціальності 122 «Комп’ютерні науки та інформаційні технології», в якій будуть готувати майбутніх докторів філософії комп’ютерних наук протягом 4 років. За цей термін аспіранти будуть вивчати наступні предмети:</p>
                            <ul class="pb-3">
                                <li class="ml-3">Філософія</li>
                                <li class="ml-3">Іноземна мова</li>
                                <li class="ml-3">Психологія та педагогіка вищої школи</li>
                                <li class="ml-3">Планування та організація виконання НДР</li>
                            </ul>
                            <p>Аспіранти будуть проходити навчально-педагогічну практику, а також вивчати предмети, що формують фахові компетентності:</p>
                            <ul class="pb-3">
                                <li class="ml-3">Математичне моделювання та оптимізація складних комп’ютерних систем</li>
                                <li class="ml-3">Глобальна оптимізація в комп’ютерних системах або Сучасні чисельні методи в комп’ютерних системах.</li>
                            </ul>
                            <p class="pb-3">Протягом 4-х років аспіранти проводять наукові дослідження, результати яких доповідають на наукових конференціях, публікують статті та пишуть дисертацію. Аспірантура закінчується захистом дисертації у спеціалізованій вченій раді. Доктор філософії має великі можливості працевлаштування як в нашій країні, так і за її межами, а в галузі IT-технологій ще й значну заробітну платню.</p>
                            <p class="pb-3">Відомості про навчально-методичне та інформаційне забезпечення можна завантажити <a target="_blank" href="http://udhtu.edu.ua/wp-content/uploads/2017/08/doc1_sks.pdf">тут</a>.</p>
                            <hr class="custom-divider mb-3"/>
                            <p class="pb-3">На кафедрі проводиться науково-дослідна робота згідно з комплексним перспективним планом наукових досліджень. Наукові роботи мають ініціативний, пошуковий характер, вони спрямовані на вирішення актуальних науково-технічних і соціально-економічних проблем.</p>
                            <p class="pb-3">Так, за замовленням Дніпропетровського обласного державного казначейства з 2005 року виконувалась комплексна науково-дослідна робота <em>“Теорія і практика економічних розрахунків та створення інформаційних систем обробки економічної інформації”</em> (номер держреєстрації 0105U003975).</p>
                            <p class="pb-3">Результати цієї роботи використовуються для створення єдиної платіжної системи по однобанківській моделі, що є складовою частиною державної програми розвитку казначейства. Суттю програми було створення при державному казначействі спеціалізованого банку з обслуговування коштів держбюджету.</p>
                            <p class="pb-3">Викладачі та студенти кафедри приймали безпосередню участь в розробці програмного забезпечення, що було встановлено в обласному казначейському банку.</p>
                            <p class="pb-3">Іншим важливим напрямком є розробка й впровадження нових інформаційних технологій в медичну діагностику. Дніпропетровським обласним діагностичним центром разом з кафедрою та Інститутом технічної механіки НАН України і НКА України розроблена дистанційна консультативна система з використанням телемедичних технологій. Задача системи – на основі супутникових систем зв’язку і Internet забезпечити доступ населення до висококваліфікованої медичної допомоги, насамперед, у Дніпропетровській області. Кафедра СКС разом з УкрНДІ медико-соціальних проблем інвалідності стала ініціатором міжнародної конференції, присвяченої впровадженню інформаційних технологій в медичну діагностику.</p>
                            <p class="pb-3">Разом з науковцями Інституту технічної механіки викладачі та студенти кафедри досліджують проблеми обробки інформації в системах дистанційного зондування Землі та приймають участь у розробці програмного забезпечення для наземних комплексів космічних систем.</p>
                            <p class="pb-3">З 2009 р. по 2011 р. на кафедрі виконувалась комплексна науково-дослідна робота <em>“Моделі і методи інтелектуалізації аналізу та управління в критичних предметних галузях в умовах обмежених ресурсів”</em> (номер держреєстрації 0109U004373).</p>
                            <p class="pb-3">Метою роботи була розробка нових математичних моделей інтелектуального аналізу та управління в умовах обмежених ресурсів; створення методів та алгоритмів реалізації таких моделей, а також розв’язання з їх допомогою прикладних задач.</p>
                            <p class="pb-3">Визначені найбільш критичні сфери розвитку українського суспільства – це модернізація економіки країни в умовах світової кризи, подолання бідності населення, поліпшення здоров’я людей та стану навколишнього середовища, скорочення правопорушень, підвищення науково технічного потенціалу.</p>
                            <p class="pb-3">Розроблена сукупність математичних моделей, які побудовані з використанням інтелектуальних технологій і можуть бути застосовані при вирішенні задач у медицині, збереження природного середовища, подолання надзвичайних ситуацій, у хімічній галузі тощо.</p>
                            <p class="pb-3">Проведена робота з удосконалення автоматизованої інформаційної моделі з науково технічного потенціалу, за допомогою якого можливо побудувати інноваційну модель української економіки.</p>
                            <p class="pb-3">Науково-технічний потенціал повинен не тільки забезпечувати ефективну роботу господарського комплексу України, але й просування її до стадії постіндустріального розвитку, характерними для якого є інформаційно-інтелектуальні технології.</p>
                            <p class="pb-3">У межах теми розроблені математичні моделі та методи аналізу процесів, що протікають під час вимірювання концентрацій важких металів у стічних водах.</p>
                            <p class="pb-3">Розроблені також математичні моделі ринкової економіки, за допомогою яких можна одержати відповіді на нові виклики, які ставить сучасне життя.</p>
                            <p class="pb-3">З 2012 р. по 2014 р. на кафедрі виконувалась комплексна науково-дослідна робота <em>“Дослідження шляхів використання інформаційних та комп’ютерних технологій при вирішенні регіональних проблем”</em> (номер держреєстрації 0112U004341). З 2015 року на кафедрі виконується науково-дослідна робота <em>«Розробка математичних моделей оцінки ефективності комп’ютерних систем»</em>. Очікувані результати: буде визначено коло задач із забезпечення ефективності функціонування комп’ютерних систем; будуть досліджені шляхи вибору оптимальних стратегій експлуатації комп’ютерних систем; будуть розроблені ефективні алгоритми і моделі функціонування комп’ютерних систем; будуть досліджені шляхи використання технологій дистанційного навчання.</p>
                            <p class="pb-3">Науково-дослідна робота на кафедрі є суттєвою складовою підготовки майбутніх фахівців. Разом з вченими кафедри студенти приймають участь у наукових конференціях, на яких обговорюють результати своїх досліджень.</p>
                            <p class="pb-3">Новий напрямок наукових досліджень був започаткований новим завідувачем кафедри СКС А.І. Косолапом, який розробляє нові методи оптимізації складних систем. Він був учасником більш ніж 40 міжнародних наукових конференцій, як в Україні, так і за її межами, де доповідав нові наукові результати та обмінювався досвідом впровадження цих результатів у навчальний процес в університетах.</p>
                            <div class="row mb-5">
                                <div class="col mx-3">
                                    <div class="card" style="width: 100%;">
                                        <img class="card-img-top" src="${assetPath(src: '/static/students/department/science/1.jpg')}">
                                        <div class="card-body">
                                            <p class="card-text">А.І. Косолап та Panos Pardalos – крупний спеціаліст в області глобальної оптимізації (Флорида, США)</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col mx-3">
                                    <div class="card" style="width: 100%;">
                                        <img class="card-img-top" src="${assetPath(src: '/static/students/department/science/2.jpg')}">
                                        <div class="card-body">
                                            <p class="card-text">А.І. Косолап та Leo Liberti – відомий спеціаліст в області глобальної оптимізації з Вищої Політехнічної школи Парижу</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col mx-3">
                                    <div class="card" style="width: 100%;">
                                        <img class="card-img-top" src="${assetPath(src: '/static/students/department/science/3.jpg')}">
                                        <div class="card-body">
                                            <p class="card-text">А.І. Косолап та Pierre Hansen – відомий спеціаліст в області глобальної оптимізації з Канади</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-5">
                                <div class="col mx-3">
                                </div>
                                <div class="col mx-3">
                                    <div class="card" style="width: 100%;">
                                        <img class="card-img-top" src="${assetPath(src: '/static/students/department/science/4.jpg')}">
                                        <div class="card-body">
                                            <p class="card-text">А.І. Косолап та Володимир Дем'янов – спеціаліст в області негладкої оптимізації Санкт-Петербурзького університету.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col mx-3">
                                </div>
                            </div>
                            <p class="pb-3">Співробітники кафедри приймають активну участь у роботі Регіонального наукового семінару Придніпровського наукового центра НАН України і МОН України “Сучасні проблеми управління й моделювання складних систем”, керівник: проф. д.т.н., Михалев А.І., НМетАУ; співкерівники проф., д.ф.-м.н. Когут П.І., ДНУ та д.т.н., с.н.с. Чумаков Л.Д., УДХТУ.</p>
                            <p class="pb-3">На базі кафедри з квітня 2003 р. щорічно проводився міжнародний молодіжний форум “Інформаційні технології у XXI сторіччі”. З 2003 року почала роботу постійно діюча міжнародна дистанційна науково-практична конференція “Інформаційні технології та кібернетика на службі охорони здоров’я 2003”.</p>
                            <p class="pb-3">У 2011 році кафедра прийняла активну участь в організації та проведенні наукової конференції “Інформаційні технології в управлінні складними системами”, яка була присвячена 100-річчю з дня народження М.К. Янгеля. Співробітниками кафедри і студентами було зроблено 16 доповідей. У жовтні 2011 року професор Алпатов А.П. зробив доповідь на 62-му Міжнародному космічному конгресі у Кейптауні, Південно-Африканська Республіка. У липні 2009 р. професор Косолап А.І. зробив доповідь на конференції “Сontinuous optimization” у Ремагені (Німеччина), а в 2010 р. та 2013 р. – на коференції “Глобальна оптимізація” у Тулузі (Франція). З 2015 р. на факультеті Комп’ютерних наук та інженерії почала роботу щорічна науко-технічна конференція “Комп’ютерне моделювання та оптимізація складних систем”, в якій кафедра СКС приймає активну участь.</p>
                            <g:clickableImage src="${assetPath(src: '/static/students/department/science/5.jpg')}" classes="cursor-pointer shadow-lg custom-image-50" onclick="showImagePopup('modalScience5')" id="science5" idModal="modalScience5"/>
                            <p>У 2002-2014 рр. підготовлені й надруковані монографії:</p>
                            <ul class="pb-3">
                                <li class="ml-3">Переверзєв Е.С., Алпатов А.П., и др. <em>“Надежность технических систем“</em>. Монографія. Днепропетровск, Изд-во “Пороги”, 2002, 396 с.</li>
                                <li class="ml-3">Алпатов А.П., Прокопчук Ю.О. и др. <em>“Госпитальные информационные системы: архітектура, модели, решения“</em>, Дніпропетровськ, УДХТУ, 2005, 257 с.</li>
                                <li class="ml-3">Прокопчук Ю.О. <em>“Интеллектуальные медицинские системы: формально-логический урівень“</em>, Дніпропетровськ, ІТМ НАН України і НКА України, 2007, 259 с.</li>
                                <li class="ml-3">Алпатов А.П., Прокопчук Ю.О. и др. <em>“Информационные технологии в образовании и здравоохранении“</em>, Дніпропетровськ, ІТМ НАН України і НКА України, 2008, 287 с.</li>
                                <li class="ml-3">Прокопчук Ю.О. <em>“Принцип граничних узагальнень: методологія, задачі, прикладення“</em>, Дніпропетровськ: ІТМ НАНУ і НКАУ, 2012, 384 с.</li>
                                <li class="ml-3">Косолап А.И. <em>“Методы глобальной оптимизации“</em>, Днепропетровск, Изд-во «Наука и образование», 2013, 316 с.</li>
                                <li class="ml-3">Косолап А.І., у складі авторського колективу. <em>“Дослідження та оптимізація економічних процесів“</em>, НТУ ХПІ, 2013, 484 с.</li>
                                <li class="ml-3">Косолап А.И. <em>“Глобальная оптимизация. Метод точной квадратичной регуляризации“</em>, Днепропетровск, Изд-во ПГАСА, 2015, 164 с.</li>
                            </ul>
                            <g:clickableImage src="${assetPath(src: '/static/students/department/science/6.jpg')}" classes="cursor-pointer shadow-lg custom-image-50" onclick="showImagePopup('modalScience6')" id="science6" idModal="modalScience6"/>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="departmentEducation">
                    <div class="row px-3 py-4">
                        <div class="col-12">
                            <p class="pb-3">Відомості про навчально-методичне забезпечення освітньої діяльності у сфері вищої освіти (магістр) – завантажуй <a target="_blank" href="http://udhtu.edu.ua/wp-content/uploads/2017/08/dd08c60c025bb313884d9ba5eabc189d.pdf">тут</a>.</p>
                            <p class="pb-3">Відомості про інформаційне забезпечення освітньої діяльності у сфері вищої освіти (магістр) – завантажуй <a target="_blank" href="http://udhtu.edu.ua/wp-content/uploads/2017/08/dd08c60c025bb313884d9ba5eabc189d.pdf">тут</a>.</p>
                            <p class="text-uppercase custom-font-weight-600">ДИСЦИПЛІНИ СПЕЦІАЛЬНОЇ ПІДГОТОВКИ (ступінь бакалавра):</p>
                            <ul class="pb-3">
                                <li class="ml-3">Програмування</li>
                                <li class="ml-3">Комп’ютерна логіка</li>
                                <li class="ml-3">Архітектура комп’ютерів</li>
                                <li class="ml-3">Комп’ютерна схемотехніка</li>
                                <li class="ml-3">Системне програмування</li>
                                <li class="ml-3">Системне програмне забезпечення</li>
                                <li class="ml-3">Технології проектування комп’ютерних систем</li>
                                <li class="ml-3">Комп’ютерні системи</li>
                                <li class="ml-3">Комп’ютерні мережі</li>
                                <li class="ml-3">Паралельні та розподілені обчислення</li>
                                <li class="ml-3">Організація баз даних</li>
                                <li class="ml-3">Захист інформації в комп’ютерних системах</li>
                                <li class="ml-3">Інженерія програмного забезпечення</li>
                                <li class="ml-3">Математичне моделювання та оптимізація комп’ютерних систем</li>
                                <li class="ml-3">Інтернет-технології</li>
                                <li class="ml-3">Проектування мікропроцесорних систем</li>
                                <li class="ml-3">Програмування на мові Java</li>
                                <li class="ml-3">Програмування на мові VBA</li>
                                <li class="ml-3">Інструментальні засоби розробки мережних додатків</li>
                                <li class="ml-3">Комп’ютерні технології в діловодстві</li>
                                <li class="ml-3">Теорія автоматичного керування</li>
                                <li class="ml-3">Цифрова обробка сигналів та зображень</li>
                                <li class="ml-3">Методи ідентифікації систем</li>
                                <li class="ml-3">Методи та моделі штучного інтелекту</li>
                            </ul>
                            <p class="text-uppercase custom-font-weight-600">ДИСЦИПЛІНИ СПЕЦІАЛЬНОЇ ПІДГОТОВКИ (ступінь магістра):</p>
                            <ul class="pb-3">
                                <li class="ml-3">Методологія та організація наукових досліджень</li>
                                <li class="ml-3">Оптимальне проектування комп’ютерних систем</li>
                                <li class="ml-3">Дослідження і проектування вбудованих комп’ютерних систем</li>
                                <li class="ml-3">Робототехніка</li>
                                <li class="ml-3">Дослідження комп’ютерних систем штучного інтелекту</li>
                                <li class="ml-3">Тестування, надійність, контроль, діагностування комп’ютерних систем</li>
                                <li class="ml-3">Цифрова обробка сигналів та зображень</li>
                                <li class="ml-3">Програмування на мові Java</li>
                            </ul>
                            <p class="text-uppercase custom-font-weight-600">ДИСЦИПЛІНИ БАЗОВОЇ ПІДГОТОВКИ (ступінь бакалавра):</p>
                            <ul class="pb-3">
                                <li class="ml-3">Українська мова (за професійним спрямуванням)</li>
                                <li class="ml-3">Історія України</li>
                                <li class="ml-3">Історія української культури</li>
                                <li class="ml-3">Іноземна мова (за професійним спрямуванням)</li>
                                <li class="ml-3">Філософія</li>
                                <li class="ml-3">Вища математика</li>
                                <li class="ml-3">Фізика</li>
                                <li class="ml-3">Теорія електричних кіл</li>
                                <li class="ml-3">Теорія ймовірностей та математична статистика</li>
                                <li class="ml-3">Алгоритми та методи обчислень</li>
                                <li class="ml-3">Дискретна математика</li>
                                <li class="ml-3">Комп’ютерна електроніка</li>
                                <li class="ml-3">Екологія</li>
                                <li class="ml-3">Політологія</li>
                                <li class="ml-3">Менеджмент організацій</li>
                                <li class="ml-3">Хімія</li>
                                <li class="ml-3">Теорія інформації та кодування</li>
                                <li class="ml-3">Системний аналіз</li>
                            </ul>
                            <p class="text-uppercase custom-font-weight-600">ДИСЦИПЛІНИ БАЗОВОЇ ПІДГОТОВКИ (ступінь магістра):</p>
                            <ul class="pb-3">
                                <li class="ml-3">Інтелектуальна власність</li>
                                <li class="ml-3">Психологія та методика викладання фахових дисциплін у вищій школи</li>
                                <li class="ml-3">Іноземна мова професійного спрямування</li>
                                <li class="ml-3">Охорона праці в галузі</li>
                                <li class="ml-3">Цивільний захист</li>
                            </ul>
                            <p class="text-uppercase custom-font-weight-600">ЧОМУ НАВЧАЮТЬСЯ СТУДЕНТИ:</p>
                            <ul class="pb-3">
                                <li class="ml-3">розбиратися та створювати комп’ютерні схеми</li>
                                <li class="ml-3">знатися на архітектурі комп’ютерів</li>
                                <li class="ml-3">створювати прикладні та системні програми</li>
                                <li class="ml-3">розуміти, як побудовані і як працюють периферійні пристрої</li>
                                <li class="ml-3">проектувати складні комп’ютерні системи</li>
                                <li class="ml-3">аналізувати та моделювати системи</li>
                                <li class="ml-3">розумітися на теорії інформації та кодування</li>
                                <li class="ml-3">розуміти теорію автоматичного керування</li>
                                <li class="ml-3">використовувати стандарти розробки програмного забезпечення</li>
                                <li class="ml-3">використовувати методи і засоби комп’ютерних інформаційних технологій</li>
                                <li class="ml-3">використовувати методи і засоби автоматизації проектування комп’ютерних систем</li>
                                <li class="ml-3">організовувати паралельні та розподілені обчислення</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>