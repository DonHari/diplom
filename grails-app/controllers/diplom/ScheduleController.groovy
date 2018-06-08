package diplom

import diplom.commands.ScheduleCommand
import diplom.validator.Validate
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.NO_CONTENT
import static org.springframework.http.HttpStatus.OK

@Secured('permitAll')
@Transactional(readOnly = true)
class ScheduleController {

    ScheduleService scheduleService

    UploadScheduleFileService uploadScheduleFileService

    @Secured('permitAll')
    def index(Integer page, Integer max) {
        List<Schedule> schedules = scheduleService.list(page, max)
        Integer scheduleCount = scheduleService.count()
        respond(schedules, model: [scheduleCount: scheduleCount])
    }

    @Secured('permitAll')
    def show(Schedule schedule) {
        respond(schedule)
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN', "IS_AUTHENTICATED_REMEMBERED"])
    def create() {
        respond(new Schedule(params), model: [justSaved: chainModel?.justSaved])
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN', "IS_AUTHENTICATED_REMEMBERED"])
    @Transactional
    def save(ScheduleCommand scheduleCommand) {
        Validate.hasNoErrors(scheduleCommand)

        String fileName = scheduleCommand.year + '_' + scheduleCommand.tetrameter + scheduleCommand.uploadedFile.originalFilename.substring(scheduleCommand.uploadedFile.originalFilename.lastIndexOf('.'))

        uploadScheduleFileService.uploadFile(scheduleCommand.uploadedFile, fileName)

        scheduleService.save(scheduleCommand.getYear(), scheduleCommand.getTetrameter(), fileName)

        chain(action: 'create', model: [justSaved: true])
    }

    @Secured('permitAll')
    def schedule() {
        List<Integer> availableYears = scheduleService.listAvailableYears()

        respond([availableYears: availableYears, currentYear: Calendar.getInstance().get(Calendar.YEAR)], view: "/schedule/schedule")
    }

    @Secured('permitAll')
    def get(Integer tetrameter, Integer year) {
        Schedule result = scheduleService.get(tetrameter, year)

        respond([schedule: result], view: "/schedule/scheduleFileLink")
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN', "IS_AUTHENTICATED_REMEMBERED"])
    def check(Integer tetrameter, Integer year, String fileName) {
        boolean scheduleExists = scheduleService.checkIfScheduleExists(tetrameter, year)
        boolean scheduleFileExists = uploadScheduleFileService.checkIfFileExists(fileName)
        render(contentType: 'application/json') {
            result(status: scheduleExists, fileStatus: scheduleFileExists)
        }
    }

    @Secured('permitAll')
    def loadFile(String fileName) {
        File file = uploadScheduleFileService.loadFile(fileName)
        response.setContentType("application/vnd.ms-excel")
        response.setHeader("Content-disposition", "attachment;filename=${fileName}")
        file.withInputStream { response.outputStream << it }
    }
}
