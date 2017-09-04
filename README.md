## 📅 iCalKit

### Very WIP. Please don't use this yet. It'll be a bit before this actually becomes presentable.

The purpose of this library is to parse and generate files that look somewhat like this:

```
BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//hacksw/handcal//NONSGML v1.0//EN
BEGIN:VEVENT
UID:uid1@example.com
DTSTAMP:19970714T170000Z
ORGANIZER;CN=John Doe:MAILTO:john.doe@example.com
DTSTART:19970714T170000Z
DTEND:19970715T035959Z
SUMMARY:Bastille Day Party
END:VEVENT
END:VCALENDAR
```

### Quickstart

Here's some quick examples of what's possible. Beware though that neither is the API currently stable nor are the types complete yet.
This might as well also be outdated, but some basic examples are always nice to have.

```swift
var event = Event() // If no further params are supplied, only `uid` and `dtstamp` are set.
event.summary = "Awesome event"
print(event) // 20160513T003222+0200: Awesome event!

let calendar = Calendar(withComponents: [event])

let iCalString = calendar.toCal()
print(iCalString)

// BEGIN:VCALENDAR
// BEGIN:VEVENT
// UID:598C754E-A90A-4862-AAA6-E52BFFE3439F
// DTSTAMP:20160513T003547+0200
// SUMMARY:Awesome event
// END:VEVENT
// END:VCALENDAR
```

```swift
let url = URL(string: "https://raw.githubusercontent.com/kiliankoe/iCalKit/master/Tests/example.ics")!
let cals = try! iCal.loadURL(url)
// or loadFile() or loadString(), all of which return [Calendar] as an ics file can contain multiple calendars

for cal in cals {
    for event in cal.subComponents where event is Event {
        print(event)
    }
}

// 19970714T190000+0200: Bastille Day Party
// 19980714T190000+0200: Something completely different
```

### Roadmap

Main ToDos:

 - [ ] Implement most of everything in [RFC 5545](https://tools.ietf.org/html/rfc5545)
 - [ ] Validate iCal files

Also see the ruby gem [icalendar](https://github.com/icalendar/icalendar) as a broad goal where this should be headed.

Given complete freedom and a good bit of time, I'd love to implement an API something like the following.
Huge kudos for the idea goes to [@hoodie](https://github.com/hoodie)!

It's very debatable though and just an idea for now. Got any additional input? Just open an issue or PR and we can discuss it 😊

```swift
// date could stand for an NSDate or something equivalent

let importantMeeting.startDate(date)
                    .repeats(.BiWeekly)

let importantMeeting.startDate(date)
                    .every(.Days(7))

let birthday = Event.startDate(date)
                    .repeats(.Anually)

let xmas = Event.every(.December(24))

let sysadminday = Event.every(.July.last.Friday)

let tdo = Todo("buy milk")

let alarm = Alarm("get up").at("05:30").every(.Thursday)
let alarm = Alarm("get up").at("06:00").on(.Fridays)

let dontDisturb = Busy.between(date).and(date)
let dontDisturb = Busy.between("09..<12").am().on(.Mondays)

let dearDiary = Journal(description: "Dear Diary\nToday my cat ran away. Now I'm sad.")

let event = Event("this is a summary")
    .startDate(date)
    .endDate(date)
    .description("some description that is more descriptive than the summary")
    .attendee("mailto:john.doe@example.com")
    .attendee(Attendee("jane.doe@example.com").hasDeclined())
    .attendee(Attendee("jim.doe@example.com").hasAccepted())
    .trigger("-PT15M")
    .repeatsEvery(.Wednesday)
    .ipClass(.Private)
```
