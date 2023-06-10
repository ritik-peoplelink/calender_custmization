import 'dart:ui';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import './meeting_model.dart';

class MeetingDataSource extends CalendarDataSource{
  MeetingDataSource (List<MeetingModel> source){
    appointments = source;
  }
  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }
  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }
  @override
  String getSubject(int index) {
    return appointments![index].meetingName;
  }
  @override
  Color getColor(int index) {
    return appointments![index].bgColor;
  }
  @override
  bool isAllDay(int index) {
    return appointments![index].isFullDay;
  }
}