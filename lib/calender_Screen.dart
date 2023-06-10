import 'dart:math';

import 'package:calender_custmization/meeting_data_source.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'meeting_model.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

final List<MeetingModel> meetings = <MeetingModel>[];

Random random = Random();

String generateRandomString(int length) {
  final random = Random();
  const availableChars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
  final randomString = List.generate(length,
      (index) => availableChars[random.nextInt(availableChars.length)]).join();

  return randomString;
}

List<Color> colorList = const [Color(0xFFFF0000),Color(0xFF0000FF),Color(0xFF00FF00),Color(0xFFA52A2A),Color(0xFF7FFFD4)];

void _loadMeetingDetails(){
  for(int i = 1;i<=30;++i)
  {
    if(i%2!=0){
      String mName = generateRandomString(6);
      var _colorsIndex = random.nextInt(5);
      DateTime startTime = DateTime(2023,06,i);
      DateTime endTime = startTime.add(Duration(hours: 4));
      meetings.add(
        MeetingModel(mName,startTime,endTime, colorList[_colorsIndex], false)
      );
    }
  }
}

class _CalenderScreenState extends State<CalenderScreen> {
  List<MeetingModel> _getDataSource() {
   _loadMeetingDetails();
    return meetings;
  }

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      cellBorderColor: Colors.black,
      dataSource: MeetingDataSource(_getDataSource()),
      monthViewSettings: MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
    );
  }
}
