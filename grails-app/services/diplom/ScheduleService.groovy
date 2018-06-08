package diplom

interface ScheduleService {
    List<Schedule> list(Integer page, Integer max)

    Schedule save(Integer year, Integer tetrameter, String fileName)

    Integer count()

    List<Integer> listAvailableYears()

    Schedule get(Integer tetrameter, Integer year)

    Boolean checkIfScheduleExists(Integer tetrameter, Integer year)
}