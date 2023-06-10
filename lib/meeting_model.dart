import 'dart:ui';

class MeetingModel{
  String meetingName;
  DateTime from;
  DateTime to;
  Color bgColor;
  bool isFullDay;
  MeetingModel(this.meetingName,this.from,this.to,this.bgColor,this.isFullDay);
}