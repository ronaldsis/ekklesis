package org.ekklesis 

import static org.joda.time.DateTimeConstants.SUNDAY
import static org.joda.time.DateTimeConstants.MONDAY
import static org.joda.time.DateTimeConstants.TUESDAY
import static org.joda.time.DateTimeConstants.WEDNESDAY
import static org.joda.time.DateTimeConstants.THURSDAY
import static org.joda.time.DateTimeConstants.FRIDAY
import static org.joda.time.DateTimeConstants.SATURDAY


class CalendarTagLib {
    static namespace = "calendar"

    def daysOfWeek = {attr, body ->
        def days = [
            [key: SUNDAY, value: 'Domingo'],
            [key: MONDAY, value: 'Lunes'],
            [key: TUESDAY, value: 'Martes'],
            [key: WEDNESDAY, value: 'Miercoles'],
            [key: THURSDAY, value: 'Jueves'],
            [key: FRIDAY, value: 'Viernes'],
            [key: SATURDAY, value: 'Sabado']
        ]
        
        def selectedDays = attr.selectedDays
        def name = attr.name
		out << "<table><tr>"
        days.eachWithIndex { def day, int index ->
            def id = "${name}_${index}"
			out << "<td>"
            out << g.checkBox(name: name, id: id, value: day.key, checked: (selectedDays?.contains(day.key)), title: day.value)
		
            out << "<label for='${id}'>${day.value[0..0]}</label>"
			out << "</td>"
        }
		out << "</table></tr>"
    }

}
