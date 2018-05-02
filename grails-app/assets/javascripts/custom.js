function layoutLoaded() {
    viewActiveLang();
}

/**
 * Подсвечивает тот язык, который сейчас будет использоваться
 */
function viewActiveLang() {
    var locale = getCookie("locale");
    console.log(window.location.href);
    if (locale.toLowerCase() === "ru") {
        document.getElementById('langRU').classList.add('active');
    } else if (locale.toLowerCase() === "ua") {
        document.getElementById('langUA').classList.add('active');
    } else {
        document.getElementById('langEN').classList.add('active');
    }
}

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) === ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) === 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function loadStudcityPage() {
    $("#studentsSchedule").removeClass('active');
    $("#studentsStudcity").addClass('active');
    $("#content").load(
        "/students/studcity"
    );
}

function loadSchedulePage() {
    $("#studentsStudcity").removeClass('active');
    $("#studentsSchedule").addClass('active');
    $("#content").load(
        "/schedule/schedule"
    )
}

//todo doesn't work
function setNewsHeaderActive() {
    console.log('1');
    document.getElementById('newsHeader').classList.add('active');
    document.getElementById('enrolleeHeader').classList.remove('active');
    document.getElementById('studentsHeader').classList.remove('active');
}

function setStudentsHeaderActive() {
    console.log('2');
    document.getElementById('studentsHeader').classList.add('active');
    document.getElementById('enrolleeHeader').classList.remove('active');
    document.getElementById('newsHeader').classList.remove('active');
}

function setEnrolleeHeaderActive() {
    console.log('3');
    document.getElementById('enrolleeHeader').classList.add('active');
    document.getElementById('newsHeader').classList.remove('active');
    document.getElementById('studentsHeader').classList.remove('active');
}

function loadSchedule() {
    var year = document.getElementById("yearSelect").value;
    var tetrameter = document.getElementById("tetrameterSelect").value;
    $('#scheduleFileLink').load(
        '/schedule/get?year=' + year + '&tetrameter=' + tetrameter
    );

}