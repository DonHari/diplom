var scheduleYearCorrect = true;//it's 2018 by default
var scheduleFileAttached = false;

function layoutLoaded() {
    viewActiveLang();
}

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

function newsContentInput() {
    maxInput(5000, '#newsContent', '#newsContentLeft');
}

function newsNameInput() {
    maxInput(50, '#newsName', '#newsNameLeft')
}

function validateNewsNameInput() {
    if ($('#newsName').val().length === 0) {
        $('#newsError #newsErrorAlert').remove();
        $('#newsError').append('<div class="alert alert-dismissible alert-danger" id="newsErrorAlert"><button type="button" class="close" data-dismiss="alert">&times;</button><span id="newsErrorText">name cannot be empty</span></div>');
    }
}

function validatePhotoExtension(source) {
    var fileName = $(source).val();
    if (fileName.length === 0) {
        return;
    }
    if (!fileName.endsWith('.jpg') && !fileName.endsWith('.png') && !fileName.endsWith('.jpeg')) {
        $('#newsError #newsErrorAlert').remove();
        $('#newsError').append('<div class="alert alert-dismissible alert-danger" id="newsErrorAlert"><button type="button" class="close" data-dismiss="alert">&times;</button><span id="newsErrorText">Not valid extension</span></div>');
    }
}

function newsDescInput() {
    maxInput(200, '#descNews', '#descNewsLeft');
}

function maxInput(maxLength, source, target) {
    var localMaxLength = maxLength;
    var currentInput = $(source).val();
    var left = localMaxLength - currentInput.length;
    var currentText = $(target).text();
    var newText = currentText.substring(0, currentText.indexOf(': ') + 2) + left;
    $(target).text(newText);
}

$(document).ready(function () {
    $('#scheduleFile').on({
        input: function () {
            fileInput('scheduleFile');
            enableScheduleSaveButton();
        },
        change: function () {
            fileInput('scheduleFile');
            enableScheduleSaveButton();
        },
        blur: function () {
            $(this).removeClass('is-valid').removeClass('is-invalid');
        }
    });
    $('#scheduleYear').on({
        change: function () {
            var currentValue = this.value;
            if (currentValue < 2018 || currentValue > 2030) {
                $(this).removeClass('is-valid').addClass('is-invalid');
                scheduleYearCorrect = false;
            } else {
                $(this).removeClass('is-invalid').addClass('is-valid');
                scheduleYearCorrect = true;
            }
            enableScheduleSaveButton();
        },
        blur: function () {
            $(this).removeClass('is-valid');
        },
        focus: function () {
            var currentValue = this.value;
            if (currentValue >= 2018 && currentValue <= 2030) {
                $(this).addClass('is-valid');
            }
        }
    });
});

function fileInput(source) {
    var fullPath = document.getElementById(source).value;
    if (fullPath) {
        var startIndex = (fullPath.indexOf('\\') >= 0 ? fullPath.lastIndexOf('\\') : fullPath.lastIndexOf('/'));
        var filename = fullPath.substring(startIndex);
        if (filename.indexOf('\\') === 0 || filename.indexOf('/') === 0) {
            filename = filename.substring(1);
        }
        if (!filename.endsWith('.xls') && !filename.endsWith('.xlsx') && !filename.endsWith('.csv')) {
            scheduleFileAttached = false;
            $('#' + source).addClass('is-invalid').removeClass('is-valid');
            $('#' + source + 'Name').text('Выберите файл');
        } else {
            scheduleFileAttached = true;
            $('#' + source).addClass('is-valid').removeClass('is-invalid');
            $('#' + source + 'Name').text(filename);
        }
    }
}

function enableScheduleSaveButton() {
    if (scheduleYearCorrect && scheduleFileAttached) {
        $('#scheduleSaveButton').removeClass('disabled');
    } else if (!$('#scheduleSaveButton').hasClass('disabled')) {
        $('#scheduleSaveButton').addClass('disabled');
    }
}

function addAssignedPhoto() {
    var currentCount = $('#assignedPhotosCount').val();
    if (currentCount === 12) {
        return;
    }
    currentCount++;
    $('#assignedPhotosCount').val(currentCount);
    $('#assignedPhotos').append('<div class="form-group mb-3"><div class="input-group"><div class="custom-file"><input type="file" class="custom-file-input" id="assignedPhoto' + currentCount + '" oninput="fileInput(\'assignedPhoto' + currentCount + '\')" accept=".jpg,.jpeg,.png" value="${photo}" name="assignedPhoto' + currentCount + '" onblur="validatePhotoExtension(\'#assignedPhoto' + currentCount + '\')"><label class="custom-file-label" for="assignedPhoto' + currentCount + '" id="assignedPhoto' + currentCount + 'Name">Выберите файл</label></div></div></div>');
    if (currentCount === 12) {
        $('#addAssignedPhotoBtn').addClass('disabled').prop('onclick', null).off('click');
        ;
    }
}

function showImagePopup(source) {
    $('#' + source).modal('toggle');
}

function checkIfScheduleExists() {
    if (!(scheduleFileAttached && scheduleYearCorrect)) {
        return false;
    }
    var url = window.location.protocol + '//' + window.location.host + '/schedule/check?tetrameter=';
    var tetrameter = document.getElementById("tetrameterSelect");
    url += tetrameter.options[tetrameter.selectedIndex].value;
    url += '$year=';
    url += $('#year').val();
    console.log(url);
    var xhr = new XMLHttpRequest();
    xhr.open('GET', url, false);
    xhr.send();
    if (JSON.parse(xhr.responseText)["result"]["status"] === true && $('#scheduleFileName').text().length !== 0) {
        return confirm('Расписание на этот тетраместр и учебный год существует. Вы хотите его перезаписать?');
    } else {
        return true;
    }
}
