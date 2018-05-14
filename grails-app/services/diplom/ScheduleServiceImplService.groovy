package diplom

import grails.transaction.Transactional
import org.grails.datastore.mapping.query.api.BuildableCriteria

@Transactional
class ScheduleServiceImplService implements ScheduleService {

    private checkIfExists = { Long id ->
        if (!Schedule.exists(id)) {
            throw new CantFindException("Can't find requested schedule!")
        }
    }

    @Override
    List<Schedule> list(Integer page, Integer max) {
        Integer localPage = page ?: 0
        Integer localMax = PageUtil.getMaxValue(max)
        Schedule.list([max: localMax, offset: localPage * localMax])
    }

    @Override
    Schedule save(Integer year, Integer tetrameter, String fileName) {
        Schedule schedule = Schedule.findByYearAndTetrameter(year, tetrameter)
        if(schedule){
            schedule.fileName = fileName
            schedule.save()
        } else {
            new Schedule(year: year, tetrameter: tetrameter, fileName: fileName)
        }
        schedule.save()
    }

    @Override
    Schedule update(Schedule schedule) {
        checkIfExists(schedule.id)
        schedule.save()
    }

    @Override
    void delete(Schedule schedule) {
        checkIfExists(schedule.id)
        schedule.delete()
    }

    @Override
    Integer count() {
        Schedule.count
    }

    @Override
    List<Integer> listAvailableYears() {
        BuildableCriteria criteria = Schedule.createCriteria()
        List<Integer> result = criteria.list {
            projections {
                groupProperty("year")
            }
            order('year', 'asc')
        } as List<Integer>
        result
    }

    @Override
    Schedule get(Integer tetrameter, Integer year){
        Schedule.findByTetrameterAndYear(tetrameter, year)
    }
}
