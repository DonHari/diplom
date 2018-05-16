var scheduleYearValid = true;//it have correct value by default
var scheduleFileValid = false;

var newsNameValid = false;
var newsMainPhotoValid = false;
var newsDescriptionValid = false;
var newsContentValid = false;
var newsAssignedPhotosValid = false;

var newsAssignedPhotoIds = ['assignedPhoto1'];

var clientWidth;
var clientHeight;

function layoutLoaded() {
}

function loadStudcityPage() {
    $("#studentsSchedule").removeClass('active');
    $("#studentsStudcity").addClass('active');
    $("#content").load(
        "/students/studcity"
    );
}

function loadSchedulePage() {
    console.log('loadSchedulePage');
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

function validatePhotoExtension(fileName) {
    if (fileName.length === 0) {
        return false;
    }
    if (!fileName.endsWith('.jpg') && !fileName.endsWith('.png') && !fileName.endsWith('.jpeg')) {
        $('#newsError #newsErrorAlert').remove();
        $('#newsError').append('<div class="alert alert-dismissible alert-danger" id="newsErrorAlert"><button type="button" class="close" data-dismiss="alert">&times;</button><span id="newsErrorText">Not valid extension</span></div>');
        return false;
    }
    return true;
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
    clientWidth = window.screen.width;
    clientHeight = window.screen.height;

    $('#newsName').on({
        input: function () {
            maxInput(50, '#' + this.id, '#' + this.id + 'Left')
        },
        change: function () {
            if ($(this).val().length === 0) {
                $(this).removeClass('is-valid').addClass('is-invalid');
                newsNameValid = false;
            } else {
                $(this).removeClass('is-invalid').addClass('is-valid');
                newsNameValid = true;
            }
            enableNewsSendButton();
        },
        blur: function () {
            if ($(this).val().length === 0) {
                $(this).removeClass('is-valid').addClass('is-invalid');
                newsNameValid = false;
            }
            $(this).removeClass('is-valid');
        }
    });
    $('#scheduleFile').on({
        input: function () {
            var fileName = fileInput(this.id);
            if (validateScheduleExtension(fileName)) {
                $('#' + this.id + 'Name').text(fileName);
                scheduleFileValid = true;
            } else {
                $(this).val('');
                $('#' + this.id + 'Name').text('Оберіть файл');
                scheduleFileValid = false;
            }
            enableScheduleSaveButton();
        },
        change: function () {
            var fileName = fileInput(this.id);
            if (validateScheduleExtension(fileName)) {
                $('#' + this.id + 'Name').text(fileName);
                scheduleFileValid = true;
            } else {
                $(this).val('');
                $('#' + this.id + 'Name').text('Оберіть файл');
                scheduleFileValid = false;
            }
            enableScheduleSaveButton();
        }
    });
    $('#newsPhoto').on({
        input: function () {
            var fileName = fileInput(this.id);
            if (validatePhotoExtension(fileName)) {
                $('#' + this.id + 'Name').text(fileName);
                newsMainPhotoValid = true;
            } else {
                $(this).val('');
                newsMainPhotoValid = false;
            }
            enableNewsSendButton();
        },
        change: function () {
            var fileName = fileInput(this.id);
            if (validatePhotoExtension(fileName)) {
                $('#' + this.id + 'Name').text(fileName);
                newsMainPhotoValid = true;
            } else {
                $(this).val('');
                newsMainPhotoValid = false;
            }
            enableNewsSendButton();
        }
    });
    $('#scheduleYear').on({
        change: function () {
            var currentValue = this.value;
            if (currentValue < 2018 || currentValue > 2030) {
                $(this).removeClass('is-valid').addClass('is-invalid');
                scheduleYearValid = false;
            } else {
                $(this).removeClass('is-invalid').addClass('is-valid');
                scheduleYearValid = true;
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
    $('#assignedPhoto1').on({
        input: function () {
            var fileName = fileInput(this.id);
            if (validatePhotoExtension(fileName)) {
                $('#' + this.id + 'Name').text(fileName);
            } else {
                $(this).val('');
            }
            validateNewsAssignedPhotos();
            enableNewsSendButton();
        },
        change: function () {
            var fileName = fileInput(this.id);
            if (validatePhotoExtension(fileName)) {
                $('#' + this.id + 'Name').text(fileName);
            } else {
                $(this).val('');
            }
            validateNewsAssignedPhotos();
            enableNewsSendButton();
        }
    });
    $('#newsContent').on({
        input: function () {
            maxInput(5000, '#' + this.id, '#' + this.id + 'Left')
        },
        change: function () {
            if ($(this).val().length === 0) {
                $(this).removeClass('is-valid').addClass('is-invalid');
                newsContentValid = false;
            } else {
                $(this).removeClass('is-invalid').addClass('is-valid');
                newsContentValid = true;
            }
            enableNewsSendButton();
        },
        blur: function () {
            if ($(this).val().length === 0) {
                $(this).removeClass('is-valid').addClass('is-invalid');
                newsContentValid = false;
            }
            $(this).removeClass('is-valid');
        }
    });
    $('#newsDescription').on({
        input: function () {
            maxInput(200, '#' + this.id, '#' + this.id + 'Left')
        },
        change: function () {
            if ($(this).val().length === 0) {
                $(this).removeClass('is-valid').addClass('is-invalid');
                newsDescriptionValid = false;
            } else {
                $(this).removeClass('is-invalid').addClass('is-valid');
                newsDescriptionValid = true;
            }
            enableNewsSendButton();
        },
        blur: function () {
            if ($(this).val().length === 0) {
                $(this).removeClass('is-valid').addClass('is-invalid');
                newsDescriptionValid = false;
            }
            $(this).removeClass('is-valid');
        }
    });
    $('#loginForm').on({
        submit: function () {
            return checkCredentials();
        }
    });
    $('.news-main-photo').on({
        resize: function () {
            var imgWidth = $(this).width();
            $(this).height(imgWidth / (clientWidth / clientHeight));
        }
    });
    $('.news-main-photo-show').on({
        resize: function () {
            var imgWidth = $(this).width();
            $(this).height(imgWidth / (clientWidth / clientHeight));
        }
    });
    $('[data-toggle="tooltip"]').tooltip();
});

function checkCredentials() {
    var url = window.location.protocol + '//' + window.location.host + '/login/check';
    var exists;
    $.ajax({
        url: url,
        type: 'POST',
        data: {username: $('#username').val(), password: $('#password').val()},
        async: false
    }).done(function (result) {
        if (result["result"]["status"]) {
            exists = true;
        } else {
            exists = false;
            $('#loginContent').prepend('<div class="alert alert-dismissible alert-danger">\n' +
                '                        <button type="button" class="close" data-dismiss="alert">&times;</button>\n' +
                '                        Логін та/або пароль неправильні' +
                '                    </div>');
        }
    });
    return exists;
}

function fileInput(source) {
    var fullPath = document.getElementById(source).value;
    console.log(fullPath);
    if (fullPath) {
        var startIndex = (fullPath.indexOf('\\') >= 0 ? fullPath.lastIndexOf('\\') : fullPath.lastIndexOf('/'));
        var filename = fullPath.substring(startIndex);
        if (filename.indexOf('\\') === 0 || filename.indexOf('/') === 0) {
            filename = filename.substring(1);
        }
        return filename;
    }
    return null;
}

function validateScheduleExtension(fileName) {
    if (fileName.length === 0) {
        return false;
    }
    return fileName.endsWith('.xls') || fileName.endsWith('.xlsx') || fileName.endsWith('.csv');

}

function enableScheduleSaveButton() {
    if (scheduleYearValid && scheduleFileValid) {
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
    var newId = 'assignedPhoto' + currentCount;
    newsAssignedPhotoIds.push(newId);
    $('#assignedPhotosCount').val(currentCount);
    $('#assignedPhotos').append('<div class="form-group mb-3"><div class="input-group"><div class="custom-file"><input type="file" class="custom-file-input" id="' + newId + '" accept=".jpg,.jpeg,.png" value="${photo}" name="' + newId + '" oninput="validateNewsAssignedPhotos()" onchange="validateNewsAssignedPhotos()"><label class="custom-file-label" for="' + newId + '" id="assignedPhoto' + currentCount + 'Name">Оберіть файл</label></div></div></div>');
    $('#assignedPhotos').append('<script>$(document).ready(function () {$("#' + newId + '").on({input: function () {var fileName = fileInput(this.id);if (validatePhotoExtension(fileName)) {$("#" + this.id + "Name").text(fileName);} else {$(this).val("");}validateNewsAssignedPhotos();enableNewsSendButton();},change: function () {var fileName = fileInput(this.id);if (validatePhotoExtension(fileName)) {$("#" + this.id + "Name").text(fileName);} else {$(this).val("");}validateNewsAssignedPhotos();enableNewsSendButton();}});});</script>');
    validateNewsAssignedPhotos();
    enableNewsSendButton();
    if (currentCount === 12) {
        $('#addAssignedPhotoBtn').addClass('disabled').prop('onclick', null).off('click');
    }
}

function showImagePopup(source) {
    $('#' + source).modal('toggle');
}

function checkIfScheduleExists() {
    if (!(scheduleFileValid && scheduleYearValid)) {
        return false;
    }
    var url = window.location.protocol + '//' + window.location.host + '/schedule/check?tetrameter=';
    var tetrameter = document.getElementById("tetrameterSelect");
    url += tetrameter.options[tetrameter.selectedIndex].value;
    url += '$year=';
    url += $('#year').val();
    var xhr = new XMLHttpRequest();
    xhr.open('GET', url, false);
    xhr.send();
    if (JSON.parse(xhr.responseText)["result"]["status"] === true && $('#scheduleFileName').text().length !== 0) {
        return confirm('Расписание на этот тетраместр и учебный год существует. Вы хотите его перезаписать?');
    } else {
        return true;
    }
}

function validateNewsAssignedPhotos() {
    var flag = true;
    console.clear();
    newsAssignedPhotoIds.forEach(function (value) {
        if ($('#' + value).val() === '') {
            console.log(value + ' false');
            flag = false;
        }
    });
    newsAssignedPhotosValid = flag;
}

function checkNewsFields() {
    return newsNameValid && newsMainPhotoValid && newsDescriptionValid && newsContentValid && newsAssignedPhotosValid;
}

function enableNewsSendButton() {
    if (!checkNewsFields() && !$('#newsSendButton').hasClass('disabled')) {
        $('#newsSendButton').addClass('disabled');
    } else if (checkNewsFields() && $('#newsSendButton').hasClass('disabled')) {
        $('#newsSendButton').removeClass('disabled');
    }
}
