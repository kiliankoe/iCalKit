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

 - [ ] Pull iCal file from web
 - [ ] Generate iCal files

Also see the ruby lib [icalendar](https://github.com/icalendar/icalendar) as somewhat of a goal where this should be headed.
