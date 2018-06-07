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

var faqQuestionValid = false;
var faqAnswerValid = false;

var registerUsernameValid = false;
var registerPasswordValid = false;

function layoutLoaded() {
}

function loadStudentsFaqPage() {
    $("#studentsSchedule").removeClass('active');
    $("#studentsRadioSection").removeClass('active');
    $("#studentsContacts").removeClass('active');
    $("#studentsFAQ").addClass('active');
    $('#studentContent').load(
        "/faq/index?faqType=STUDENTS"
    );
}

function loadEnrolleeFaqPage() {
    $("#studentsDepartment").removeClass('active');
    $("#studentsFaculty").removeClass('active');
    $("#studentsStudcity").removeClass('active');
    $("#studentsProgram").removeClass('active');
    $("#studentsRadioSection").removeClass('active');
    $("#enrolleeFaq").addClass('active');
    $('#enrolleeContent').load(
        "/faq/index?faqType=ENTRANTS"
    );
}

function loadContactsPage(id) {
    $("#studentsSchedule").removeClass('active');
    $("#studentsRadioSection").removeClass('active');
    $("#studentsFAQ").removeClass('active');
    $("#studentsContacts").addClass('active');
    $(id).load(
        "/students/contacts"
    );
}

function loadRadioSectionPage(id) {
    $("#studentsSchedule").removeClass('active');
    $("#studentsFaculty").removeClass('active');
    $("#studentsDepartment").removeClass('active');
    $("#studentsStudcity").removeClass('active');
    $("#studentsProgram").removeClass('active');
    $("#studentsContacts").removeClass('active');
    $("#studentsFAQ").removeClass('active');
    $("#enrolleeFaq").removeClass('active');
    $("#studentsRadioSection").addClass('active');
    $(id).load(
        "/students/radioSection"
    );
}

function loadProgramPage() {
    $("#studentsSchedule").removeClass('active');
    $("#studentsFaculty").removeClass('active');
    $("#studentsDepartment").removeClass('active');
    $("#studentsStudcity").removeClass('active');
    $("#studentsRadioSection").removeClass('active');
    $("#enrolleeFaq").removeClass('active');
    $("#studentsProgram").addClass('active');
    $("#enrolleeContent").load(
        "/students/program"
    );
}

function loadStudcityPage(id) {
    $("#studentsSchedule").removeClass('active');
    $("#studentsFaculty").removeClass('active');
    $("#studentsDepartment").removeClass('active');
    $("#studentsProgram").removeClass('active');
    $("#studentsRadioSection").removeClass('active');
    $("#enrolleeFaq").removeClass('active');
    $("#studentsStudcity").addClass('active');
    $(id).load(
        "/students/studcity"
    );
}

function loadSchedulePage(id) {
    $("#studentsStudcity").removeClass('active');
    $("#studentsFaculty").removeClass('active');
    $("#studentsDepartment").removeClass('active');
    $("#studentsProgram").removeClass('active');
    $("#studentsRadioSection").removeClass('active');
    $("#studentsContacts").removeClass('active');
    $("#studentsFAQ").removeClass('active');
    $("#studentsSchedule").addClass('active');
    $(id).load(
        "/schedule/schedule"
    )
}

function loadFacultyPage(id) {
    $("#studentsDepartment").removeClass('active');
    $("#studentsSchedule").removeClass('active');
    $("#studentsStudcity").removeClass('active');
    $("#studentsProgram").removeClass('active');
    $("#studentsRadioSection").removeClass('active');
    $("#enrolleeFaq").removeClass('active');
    $("#studentsFaculty").addClass('active');
    $(id).load(
        "/students/faculty"
    )
}

function loadDepartmentPage(id) {
    $("#studentsFaculty").removeClass('active');
    $("#studentsSchedule").removeClass('active');
    $("#studentsStudcity").removeClass('active');
    $("#studentsProgram").removeClass('active');
    $("#studentsRadioSection").removeClass('active');
    $("#enrolleeFaq").removeClass('active');
    $("#studentsDepartment").addClass('active');
    $("#enrolleeContent").load(
        "/students/department"
    )
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
                $('#newsPhotoHidden').text(fileName);
                newsMainPhotoValid = true;
            } else {
                $(this).val('');
                $('#newsPhotoHidden').text('');
                newsMainPhotoValid = false;
            }
            enableNewsSendButton();
        },
        change: function () {
            var fileName = fileInput(this.id);
            if (validatePhotoExtension(fileName)) {
                $('#' + this.id + 'Name').text(fileName);
                $('#newsPhotoHidden').text(fileName);
                newsMainPhotoValid = true;
            } else {
                $(this).val('');
                $('#newsPhotoHidden').text('');
                newsMainPhotoValid = false;
            }
            enableNewsSendButton();
        }
    });
    $('#scheduleYear').on({
        change: function () {
            var currentValue = this.value;
            if (currentValue < 2018 || currentValue > $(this).attr('max')) {
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
            if (currentValue >= 2018 && currentValue <= $(this).attr('max')) {
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
    $('#faqQuestion').on({
        input: function () {
            maxInput(100, '#' + this.id, '#' + this.id + 'Left')
        },
        change: function () {
            if ($(this).val().length === 0) {
                $(this).removeClass('is-valid').addClass('is-invalid');
                faqQuestionValid = false;
            } else {
                $(this).removeClass('is-invalid').addClass('is-valid');
                faqQuestionValid = true;
            }
            enableFaqSendButton();
        },
        blur: function () {
            if ($(this).val().length === 0) {
                $(this).removeClass('is-valid').addClass('is-invalid');
                faqQuestionValid = false;
            }
            $(this).removeClass('is-valid');
        }
    });
    $('#faqAnswer').on({
        input: function () {
            maxInput(100, '#' + this.id, '#' + this.id + 'Left')
        },
        change: function () {
            if ($(this).val().length === 0) {
                $(this).removeClass('is-valid').addClass('is-invalid');
                faqAnswerValid = false;
            } else {
                $(this).removeClass('is-invalid').addClass('is-valid');
                faqAnswerValid = true;
            }
            enableFaqSendButton();
        },
        blur: function () {
            if ($(this).val().length === 0) {
                $(this).removeClass('is-valid').addClass('is-invalid');
                faqAnswerValid = false;
            }
            $(this).removeClass('is-valid');
        }
    });
    $(".clickable-row").click(function () {
        console.log($(this).data("href"));
        window.location = $(this).data("href");
    });
    $('#userEnableEditButton').on({
        click: function () {
            if ($(this).text() === 'Включити редагування') {
                $(this).text('Виключити редагування');
            } else {
                $(this).text('Включити редагування');
            }
            $('#userSurname').prop('disabled', !$('#userSurname').prop('disabled'));
            $('#userName').prop('disabled', !$('#userName').prop('disabled'));
            $('#userSecondName').prop('disabled', !$('#userSecondName').prop('disabled'));
            $('#userEmail').prop('disabled', !$('#userEmail').prop('disabled'));
            $('#userRoleSelect').prop('disabled', !$('#userRoleSelect').prop('disabled'));
            $('#userEnabledCheckbox').prop('disabled', !$('#userEnabledCheckbox').prop('disabled'));
            $('#userAccountLockedCheckbox').prop('disabled', !$('#userAccountLockedCheckbox').prop('disabled'));
            $('#userAccountExpiredCheckbox').prop('disabled', !$('#userAccountExpiredCheckbox').prop('disabled'));
            $('#userPasswordExpiredCheckbox').prop('disabled', !$('#userPasswordExpiredCheckbox').prop('disabled'));
            $('#userConfirmButton').prop('disabled', !$('#userConfirmButton').prop('disabled'));
        }
    });
    $('#userUsername').on({
        change: function () {
            if ($(this).val().length >= 4) {
                enableUsernameChangeButton();
                $(this).removeClass('is-invalid');
            } else {
                $(this).addClass('is-invalid');
                $('#usernameEditSubmit').prop('disabled', true);
            }
        }
    });
    $('#userPasswordForUsernameEdit').on({
        change: function () {
            if ($(this).val().length >= 4) {
                enableUsernameChangeButton();
                $(this).removeClass('is-invalid');
            } else {
                $(this).addClass('is-invalid');
                $('#usernameEditSubmit').prop('disabled', true);
            }
        }
    });
    $('#newPasswordEdit').on({
        change: function () {
            if ($(this).val().length >= 4) {
                enablePasswordChangeButton();
                $(this).removeClass('is-invalid');
                if ($(this).val() !== $('#newPasswordEditConfirm').val() && $('#newPasswordEditConfirm').val().length != 0) {
                    $('#newPasswordEditConfirm').addClass('is-invalid');
                } else {
                    $('#newPasswordEditConfirm').removeClass('is-invalid');
                }
            } else {
                $('passwordEditSubmit').prop('disabled', true);
                $(this).addClass('is-invalid');
            }
        }
    });
    $('#newPasswordEditConfirm').on({
        change: function () {
            if ($(this).val() === $('#newPasswordEdit').val()) {
                enablePasswordChangeButton();
                $(this).removeClass('is-invalid');
            } else {
                $('passwordEditSubmit').prop('disabled', true);
                $(this).addClass('is-invalid');
            }
        }
    });
    $('#userPasswordForPasswordEdit').on({
        change: function () {
            if ($(this).val().length >= 4) {
                enablePasswordChangeButton();
                $(this).removeClass('is-invalid');
            } else {
                $('passwordEditSubmit').prop('disabled', true);
                $(this).addClass('is-invalid');
            }
        }
    });
    $('#password').on({
        blur: function () {
            //todo validate password
        }
    });
    $('#passwordConfirm').on({
        blur: function () {
            //todo validate password
        }
    });
    $('#userRegisterUsername').on({
        blur: function () {
            var url = window.location.protocol + '//' + window.location.host + '/user/checkUsername';
            $.ajax({
                url: url,
                type: 'POST',
                data: {username: $(this).val()}
            }).done(function (result) {
                if (!result["result"]["available"]) {
                    $('#userRegisterUsername').addClass('is-invalid');
                    registerUsernameValid = false;
                } else {
                    $('#userRegisterUsername').removeClass('is-invalid');
                    registerUsernameValid = true;
                }
                enableRegisterButton();
            })
        }
    });
    $('#userRegisterPassword').on({
        change: function () {
            var confirmPassword = $('#userRegisterPasswordConfirm').val();
            if (confirmPassword !== $(this).val()) {
                $(this).addClass('is-invalid');
                registerPasswordValid = false;
            } else {
                $(this).removeClass('is-invalid');
                registerPasswordValid = true;
            }
            enableRegisterButton();
        }
    });
    $('#userRegisterPasswordConfirm').on({
        change: function () {
            var password = $('#userRegisterPasswordConfirm').val();
            if (password !== $(this).val()) {
                $('#userRegisterPassword').addClass('is-invalid');
                registerPasswordValid = false;
            } else {
                $('#userRegisterPassword').removeClass('is-invalid');
                registerPasswordValid = true;
            }
            enableRegisterButton();
        }
    });
    $('#player').on({
        load: function () {
            console.log('load player');
            // 2. This code loads the IFrame Player API code asynchronously.
            var tag = document.createElement('script');

            tag.src = "https://www.youtube.com/iframe_api";
            var firstScriptTag = document.getElementsByTagName('script')[0];
            firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

            // 3. This function creates an <iframe> (and YouTube player)
            //    after the API code downloads.
            var player;

            function onYouTubeIframeAPIReady() {
                player = new YT.Player('player', {
                    height: '390',
                    width: '640',
                    videoId: 'zWKNAWYXLWU',
                    events: {
                        // 'onReady': onPlayerReady,
                        'onStateChange': onPlayerStateChange
                    }
                });
            }

            // 4. The API will call this function when the video player is ready.
            function onPlayerReady(event) {
                event.target.playVideo();
            }

            // 5. The API calls this function when the player's state changes.
            //    The function indicates that when playing a video (state=1),
            //    the player should play for six seconds and then stop.
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
        }
    });
    $('#scheduleForm').submit(function () {
        if (!(scheduleFileValid && scheduleYearValid)) {
            return false;
        }
        var url = window.location.protocol + '//' + window.location.host + '/schedule/check';
        var status;
        $.ajax({
            url: url,
            type: 'GET',
            data: {
                tetrameter: $('#tetrameterSelect').val(),
                year: $('#scheduleYear').val(),
                fileName: $('#scheduleFileName').text()
            },
            async: false
        }).done(function (result) {
            if (result["result"]["status"] && result["result"]["fileStatus"]) {
                status = confirm('Розклад на обрані тетраместр і рік існує. Також існує файл, котрий ви бажаєте додати. Якщо ви згодні, файл і розклад будуть перезаписані, але із-за цього можуть виникнути проблеми. Ви бажаєте продовжити?');
            } else if (result["result"]["status"] && !result["result"]["fileStatus"]) {
                status = confirm('Розклад на обрані тетраместр і рік існують. Ви бажаєте їх перезаписати?')
            } else if (!result["result"]["status"] && result["result"]["fileStatus"]) {
                status = confirm("Файл з таким же ім'ям вже існує. Якщо його перезаписати, можуть виникнути проблеми з цілісностью інформації в базі даних. Бажано, щоб ви перейменували файл і повторили додання розкладу. Ви бажаєте продовжити?");
            } else {
                status = true;
            }

        });
        return status;
    });
    $("#assignedPhoto0").on({
        input: function () {
            console.log('input');
            var fileName = fileInput(this.id);
            console.log(fileName);
            if (validatePhotoExtension(fileName)) {
                $("#assignedPhoto0Name").text(fileName);
            } else {
                $(this).val("");
            }
        }, change: function () {
            console.log('change');
            var fileName = fileInput(this.id);
            console.log(fileName);
            if (validatePhotoExtension(fileName)) {
                $("#assignedPhoto0Name").text(fileName);
            } else {
                $(this).val("");
            }
        }
    });
    $('#newsDateCreated').text(new Date(+$('#newsDateCreated').text()));
});

function enableRegisterButton() {
    console.log(registerUsernameValid + ' && ' + registerPasswordValid + ' = ' + (registerUsernameValid && registerPasswordValid));
    $('registrationBtn').prop('disabled', registerUsernameValid && registerPasswordValid);
}

function enablePasswordChangeButton() {
    var newPasswordValid = $('#newPasswordEdit').val().length >= 4;
    var newPasswordConfirmValid = $('#newPasswordEditConfirm').val().length >= 4;
    var userPasswordForPasswordEditValid = $('#userPasswordForPasswordEdit').val().length >= 4;
    var newPasswordsAreSame = $('#newPasswordEdit').val() === $('#newPasswordEditConfirm').val();
    if (newPasswordValid && newPasswordConfirmValid && userPasswordForPasswordEditValid && newPasswordsAreSame) {
        console.log('if');
        $('#passwordEditSubmit').prop('disabled', false);
    } else {
        console.log('else');
        $('#passwordEditSubmit').prop('disabled', true);
    }
}

function enableUsernameChangeButton() {
    var userUsernameValid = $('#userUsername').val().length >= 4;
    var userPasswordForUsernameEditValid = $('#userPasswordForUsernameEdit').val().length >= 4;
    if (userUsernameValid && userPasswordForUsernameEditValid) {
        $('#usernameEditSubmit').prop('disabled', false);
    }
}

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
            $('#loginError').html('<div class="alert alert-dismissible alert-danger">\n' +
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
        $('#' + source + 'Hidden').val(filename);
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

function addEditAssignedPhoto() {
    var currentCount = $('#assignedPhotosCount').val();
    if (currentCount === 12) {
        return;
    }
    currentCount++;
    var newId = 'assignedPhoto' + currentCount;
    newsAssignedPhotoIds.push(newId);
    $('#assignedPhotosCount').val(currentCount);
    $('#assignedPhotos').append('<div class="form-group mb-3"><div class="input-group"><div class="custom-file"><input type="file" class="custom-file-input" id="' + newId + '" accept=".jpg,.jpeg,.png" value="${photo}" name="' + newId + '" oninput="validateNewsAssignedPhotos()" onchange="validateNewsAssignedPhotos()"><label class="custom-file-label" for="' + newId + '" id="assignedPhoto' + currentCount + 'Name">Оберіть файл</label><input type="hidden" value="${assignedPhoto.fileName}" name="assignedPhoto' + currentCount + 'Name" id="assignedPhoto' + currentCount + 'Hidden"/></div></div></div>');
    $('#assignedPhotos').append('<script>$(document).ready(function () {$("#' + newId + '").on({input: function () {var fileName = fileInput(this.id);if (validatePhotoExtension(fileName)) {$("#" + this.id + "Name").text(fileName);} else {$(this).val("");}validateNewsAssignedPhotos();enableNewsSendButton();},change: function () {var fileName = fileInput(this.id);if (validatePhotoExtension(fileName)) {$("#" + this.id + "Name").text(fileName);} else {$(this).val("");}validateNewsAssignedPhotos();enableNewsSendButton();}});});</script>');
    newsAssignedPhotoIds.forEach(function (value) {
        if ($('#' + value).val() === '') {
            flag = false;
        }
    });
    if (flag) {
        $('#newsSendButton').removeClass('disabled');
    } else {
        $('#newsSendButton').addClass('disabled');
    }
    enableNewsSendButton();
    if (currentCount === 12) {
        $('#addAssignedPhotoBtn').addClass('disabled').prop('onclick', null).off('click');
    }
}

function showImagePopup(source) {
    $('#' + source).modal('toggle');
}

function validateNewsAssignedPhotos() {
    var flag = true;
    newsAssignedPhotoIds.forEach(function (value) {
        if ($('#' + value).val() === '') {
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

function checkFaqFields() {
    return faqQuestionValid && faqAnswerValid;
}

function enableFaqSendButton() {
    if (!checkFaqFields() && !$('#faqSendButton').hasClass('disabled')) {
        $('#faqSendButton').addClass('disabled');
    } else if (checkFaqFields() && $('#faqSendButton').hasClass('disabled')) {
        $('#faqSendButton').removeClass('disabled');
    }
}

function loadNewsInstructionPage() {
    $('#instructionsSchedule').removeClass('active');
    $('#instructionsMy').removeClass('active');
    $('#instructionsFaq').removeClass('active');
    $('#instructionsUsers').removeClass('active');
    $('#instructionsNews').addClass('active');
    $('#instructionContent').load(
        "/instructions/news"
    );
}

function loadScheduleInstructionPage() {
    $('#instructionsFaq').removeClass('active');
    $('#instructionsMy').removeClass('active');
    $('#instructionsUsers').removeClass('active');
    $('#instructionsNews').removeClass('active');
    $('#instructionsSchedule').addClass('active');
    $('#instructionContent').load(
        "/instructions/schedule"
    );
}

function loadFaqInstructionPage() {
    $('#instructionsUsers').removeClass('active');
    $('#instructionsMy').removeClass('active');
    $('#instructionsNews').removeClass('active');
    $('#instructionsSchedule').removeClass('active');
    $('#instructionsFaq').addClass('active');
    $('#instructionContent').load(
        "/instructions/faq"
    );
}

function loadUsersInstructionPage() {
    $('#instructionsNews').removeClass('active');
    $('#instructionsSchedule').removeClass('active');
    $('#instructionsFaq').removeClass('active');
    $('#instructionsMy').removeClass('active');
    $('#instructionsUsers').addClass('active');
    $('#instructionContent').load(
        "/instructions/users"
    );
}

function loadMyInstructionPage() {
    $('#instructionsNews').removeClass('active');
    $('#instructionsSchedule').removeClass('active');
    $('#instructionsFaq').removeClass('active');
    $('#instructionsUsers').removeClass('active');
    $('#instructionsMy').addClass('active');
    $('#instructionContent').load(
        "/instructions/my"
    );
}