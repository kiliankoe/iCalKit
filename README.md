## 📅 iCal

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

### Roadmap

Types to support:

 - [ ] VCALENDAR
 - [ ] VEVENT
 - [ ] VALARM
 - [ ] VTODO
 - & other stuff, see [RFC 5545](https://tools.ietf.org/html/rfc5545) for details

Features to support:

 - [X] Pull iCal file from web
 - [X] Generate iCal files
 - [ ] Validate iCal files

Also see the ruby lib [icalendar](https://github.com/icalendar/icalendar) as somewhat of a goal where this should be headed.

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
let url = NSURL(string: "https://raw.githubusercontent.com/kiliankoe/iCal/master/example.ics")!
let cals = try! iCal.loadURL(url)

for cal in cals {
    for event in cal.subComponents where event is Event {
        print(event)
    }
}
```
