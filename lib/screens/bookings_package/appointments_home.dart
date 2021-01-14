import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saloon_plus_barber/ThemeData/fontstyle.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppointmentsHome extends StatefulWidget {
  @override
  _AppointmentsHomeState createState() => _AppointmentsHomeState();
}

class _AppointmentsHomeState extends State<AppointmentsHome> {
  final DateTime nowTime = DateTime.now();
  DateTime _selectedTime = DateTime.now();
  CalendarController _calendarController = new CalendarController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 12, //65.0.h,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 30,
            itemBuilder: (BuildContext cntxt, int index) {
              return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedTime = nowTime.add(Duration(days: index));
                    });
                    _calendarController.displayDate = _selectedTime;
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 9, //42.0.w,
                    margin: EdgeInsets.only(right: 7.0.w, left: 7.0.w),
                    child: Column(
                      children: [
                        Text(
                          "${DateFormat('EEE').format(nowTime.add(Duration(days: index)))}",
                          style: FontStyle.productsansBold(Colors.white, 14),
                        ),
                        SizedBox(
                          height: 5.0.h,
                        ),
                        CircleAvatar(
                          radius:
                              MediaQuery.of(context).size.width / 24, //14.0.h,
                          backgroundColor: _selectedTime
                                      .difference(
                                          nowTime.add(Duration(days: index)))
                                      .inSeconds ==
                                  0
                              ? FontStyle.secondaryColor
                              : FontStyle.primaryColor,
                          child: Text(
                            "${nowTime.add(Duration(days: index)).day}",
                            style: FontStyle.productsansBold(
                                _selectedTime
                                            .difference(nowTime
                                                .add(Duration(days: index)))
                                            .inSeconds ==
                                        0
                                    ? FontStyle.primaryColor
                                    : Colors.white,
                                16),
                          ),
                        ),
                      ],
                    ),
                  ));
            },
          ),
        ),
        Expanded(
          child: SfCalendar(
            view: CalendarView.day,
            timeRegionBuilder: timeRegionBuilder,
            viewHeaderStyle: ViewHeaderStyle(
              dayTextStyle: FontStyle.productsansBold(Colors.white, 14),
              dateTextStyle: FontStyle.productsansBold(Colors.white, 16),
            ),
            headerStyle: CalendarHeaderStyle(
              //backgroundColor: FontStyle.primaryColor,
              textStyle:
                  FontStyle.productsansBold(FontStyle.secondaryColor, 19),
              textAlign: TextAlign.center,
            ),
            controller: _calendarController,
            // onTap: (val) {

            // },
            minDate: nowTime,
            maxDate: nowTime.add(Duration(days: 29)),
            initialSelectedDate: nowTime,
            initialDisplayDate: nowTime,
            // onViewChanged: (val) {
            //   print(val.visibleDates);
            // },
            // onLongPress: (val) {
            //   print(val.date);
            // },
            backgroundColor: FontStyle.middleColor,
            todayTextStyle: FontStyle.productsansBold(null, 19),
            todayHighlightColor: FontStyle.secondaryColor,
            specialRegions: _getBreakRegions(),
            timeSlotViewSettings: TimeSlotViewSettings(
              startHour: 9,
              endHour: 18,
              timeInterval: Duration(hours: 1),
              timeIntervalHeight: 80.0.h,
              timeTextStyle:
                  FontStyle.productsansBold(FontStyle.secondaryColor, 12),
              dateFormat: 'd',
              dayFormat: 'EEE',
            ),
            dataSource: MeetingDataSource(_getDataSource()),
          ),
        ),
      ],
    ));
  }

  List<Meeting> _getDataSource() {
    List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 30, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }

  List<TimeRegion> _getBreakRegions() {
    final List<TimeRegion> regions = <TimeRegion>[];
    regions.add(TimeRegion(
      startTime:
          DateTime(nowTime.year, nowTime.month, nowTime.day, 13, 0, 0, 0),
      endTime: DateTime(nowTime.year, nowTime.month, nowTime.day, 14, 0, 0, 0),
      enablePointerInteraction: false,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=1',
      textStyle: FontStyle.productsansMedium(null, 16),
      color: Colors.grey, //FontStyle.secondaryColor,
      text: 'Break',
    ));

    return regions;
  }
}

Widget timeRegionBuilder(
    BuildContext context, TimeRegionDetails timeRegionDetails) {
  return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
            color: FontStyle.secondaryColor,
            height: 80.0.h,
            width: 3.0.w,
          ),
          SizedBox(
            width: 5.0.w,
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0.h, bottom: 5.0.h, right: 5.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Client 1",
                    style: FontStyle.productsansBold(Colors.white, 16)),
                SizedBox(
                  height: 3.0.h,
                ),
                Text(
                  "Hair Cut",
                  style: FontStyle.productsansMedium(Colors.white54, 14),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(top: 5.0.h, bottom: 5.0.h, right: 5.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "11:00 AM",
                  style: FontStyle.productsansMedium(Colors.white54, 14),
                ),
                SizedBox(
                  height: 3.0.h,
                ),
                Text(
                  "CONFIRMED",
                  style:
                      FontStyle.productsansMedium(FontStyle.secondaryColor, 14),
                ),
              ],
            ),
          ),
        ],
      ));
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].to;
  }

  @override
  String getSubject(int index) {
    return appointments[index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments[index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments[index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
