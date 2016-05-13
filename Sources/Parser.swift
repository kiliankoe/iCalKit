import Foundation

internal class Parser {
    let icsContent: [String]

    init(_ ics: [String]) {
        icsContent = ics
    }

    func read() throws -> [Calendar] {

        var completeCal = [Calendar?]()

        // Such state, much wow

        var inCalendar = false
        var currentCalendar: Calendar? = nil

        var inEvent = false
        var currentEvent: Event? = nil

        var inAlarm = false
        var currentAlarm: Alarm? = nil

        for (_ , line) in icsContent.enumerate() {

            switch line {
            case "BEGIN:VCALENDAR":
                inCalendar = true
                currentCalendar = Calendar()
                continue
            case "END:VCALENDAR":
                inCalendar = false
                completeCal.append(currentCalendar)
                currentCalendar = nil
                continue
            case "BEGIN:VEVENT":
                inEvent = true
                currentEvent = Event()
                continue
            case "END:VEVENT":
                inEvent = false
                currentCalendar?.append(currentEvent)
                currentEvent = nil
                continue
            case "BEGIN:VALARM":
                inAlarm = true
                currentAlarm = Alarm()
                continue
            case "END:VALARM":
                inAlarm = false
                currentEvent?.append(currentAlarm)
                currentAlarm = nil
                continue
            default:
                break
            }

            let (key, value) = line.toKeyValuePair(splittingOn: ":")

            if inCalendar && !inEvent {
                currentCalendar?.addAttribute(key, value)
            }

            if inEvent && !inAlarm {
                currentEvent?.addAttribute(key, value)
            }

            if inAlarm {
                currentAlarm?.addAttribute(key, value)
            }
        }

        return completeCal.flatMap{ $0 }
    }
}
