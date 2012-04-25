package tekdays

class TekEvent {
    String city
    String name
    String organizer
    String venue
    Date startDate
    Date endDate
    String description

    static constraints = {
      name()
      city()
      description(maxSize: 5000)
      organizer()
      venue()
      startDate()
      endDate()
    }

    String toString() {
      "${name}, ${city}"
    }
}
