<!doctype html>
<html>
<head>
    <title><g:message code="header.student" default="For students"/></title>
    <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
</head>
<body>
    <div class="row">
        <div class="col-lg-4 col-md-4">
            %{--<img class="img-fluid" src="${createLink(controller: "image", action: "getResourceImage", params: [path: '/static/students', file:'studcity_director.jpg'])}"/>--}%
            <img class="img-fluid" src="${assetPath(src: '/static/students/studcity_director.jpg')}">
        </div>
        <div class="col-lg-8 col-md-8">
            <div class="row">
                <div class="col">
                    <h4>Абрамов Олександр Анатолійович</h4>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col">
                    <h6 class="text-muted">Директор студмістечка</h6>
                </div>
            </div>
            <address class="mt-3">
                корпус № 10 (АГЧ), другий поверх<br/>Пн-Пт, 8:30-17:15<br/>+38 (0562) 47-33-50<br/>сampus@udhtu.edu.ua
            </address>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <p class="pt-3">
                На території університету розташовано 5 гуртожитків – усі іногородні студенти повністю забезпечені місцями. Мешканцям студмістечка створено належні умови для навчання та відпочинку. У всіх гуртожитках проведено локальну комп’ютерну мережу з можливістю доступу в кожній кімнаті до Internet. У визначених точках здійснюється безкоштовне користування послугами Internet (Wi-Fi).
            </p>
            <p class="pt-3">
                Гуртожитки вигідно розташовані у центрі міста та мають зручне транспортне сполучення.
            </p>
            <p class="pt-3">
                Вартість проживання залежить від розміру академічної стипендії та вартості комунальних послуг.
            </p>
        </div>
    </div>
    <div class="row pt-4">
        <div class="col-12">
            <div class="accordion" id="accordion">
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h5 class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#dormitoryOne" aria-expanded="false" aria-controls="dormitoryOne">
                                Гуртожиток №2
                            </button>
                        </h5>
                    </div>
                    <div id="dormitoryOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-4">
                                    <img class="img-fluid" src="${assetPath(src: '/static/students/dormitory_2.jpg')}">
                                </div>
                                <div class="col-8">
                                    <address>
                                        просп. Гагаріна, 67, м. Дніпро, 49005<br/>+38 (056) 713-42-08, +38 (0562) 46-17-01
                                    </address>
                                </div>
                            </div>
                            <div class="row pt-5">
                                <div class="col-4">
                                    <img class="img-fluid" src="${assetPath(src: '/static/students/dormitory_2_director.jpg')}">
                                </div>
                                <div class="col-8">
                                    <p>
                                        <strong>Завідувач гуртожитку:</strong>Єфремова Оксана Юріївна
                                    </p>
                                    <p class="pt-3">
                                        понеділок – п’ятниця, 8.30-17.15
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <p class="pt-5 pb-3">Голова студради гуртожитку: Гороз Осман Рустемович</p>
                                    <p class="pt-3">Проживають студенти факультету технології неорганічних речовин (ТНР).</p>
                                    <p class="pt-3">Це 5-ти поверхова цегляна будівля, кількість місць – 400.</p>
                                    <p class="pt-3">Гуртожиток № 2 – коридорного типу, кімнати розраховані для проживання 3 осіб.</p>
                                    <p class="pt-3">На кожному поверсі знаходиться кухня, обладнана газовими плитами.</p>
                                    <p class="pt-3">Санвузли та кімнати з умивальниками – в обох кінцях коридору.</p>
                                    <p class="pt-3">Душова кімната розташована в підвальному приміщенні і працює з 16.00 до 22.00</p>
                                    <p class="pt-3">У гуртожитку є кімната для самопідготовки, де студенти мають можливість навчатися, проводити різні культурно-масові заходи та кімната для занять спортом.</p>
                                    <p class="pt-3">Є пральна кімната, обладнана 3 пральними машинами-автомат. Прання – безкоштовне!</p>
                                    <p class="pt-3">Гуртожиток розташований в 10 хвилинах ходьби від головного навчального корпусу № 1 (просп. Гагаріна, 8) та торгівельного комплексу “Нагорка”, де знаходяться супермаркет “Варус”, аптека, кафе, відділення “Нової пошти”, магазин канцтоварів тощо.</p>
                                    <p class="pt-3">Зупинки громадського транспорту (тролейбус, маршрутні таксі та трамваю № 1) поряд з гуртожитком.</p>
                                </div>
                            </div>
                            <div id="carouselExampleIndicators" class="carousel slide mt-3" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="6"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="7"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="8"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="9"></li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img class="d-block w-100" src="${assetPath(src: '/static/students/dormitory_2_1.jpg')}">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="${assetPath(src: '/static/students/dormitory_2_2.jpg')}">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="${assetPath(src: '/static/students/dormitory_2_3.jpg')}">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="${assetPath(src: '/static/students/dormitory_2_4.jpg')}">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="${assetPath(src: '/static/students/dormitory_2_5.jpg')}">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="${assetPath(src: '/static/students/dormitory_2_6.jpg')}">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="${assetPath(src: '/static/students/dormitory_2_7.jpg')}">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="${assetPath(src: '/static/students/dormitory_2_8.jpg')}">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="${assetPath(src: '/static/students/dormitory_2_9.jpg')}">
                                    </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header" id="headingTwo">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#dormitoryTwo" aria-expanded="false" aria-controls="dormitoryTwo">
                                Гутрожиток №3
                            </button>
                        </h5>
                    </div>
                    <div id="dormitoryTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                        <div class="card-body">
                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header" id="headingThree">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#dormitoryThree" aria-expanded="false" aria-controls="dormitoryThree">
                                Гутрожиток №4
                            </button>
                        </h5>
                    </div>
                    <div id="dormitoryThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                        <div class="card-body">
                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header" id="headingFour">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#dormitoryFour" aria-expanded="false" aria-controls="dormitoryFour">
                                Гутрожиток №5
                            </button>
                        </h5>
                    </div>
                    <div id="dormitoryFour" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                        <div class="card-body">
                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header" id="headingFive">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#dormitoryFive" aria-expanded="false" aria-controls="dormitoryFive">
                                Гутрожиток №6
                            </button>
                        </h5>
                    </div>
                    <div id="dormitoryFive" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                        <div class="card-body">
                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
