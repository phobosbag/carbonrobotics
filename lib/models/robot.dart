import 'package:untitled/enum.dart';

class Robot {
  final String serial;
  final List<History> history;

  Robot({required this.serial, required this.history});
}

class History {
  final int timestampMs;
  final Location location;
  final String crop;
  final Status status;
  final List<Alarm> alarmList;

  History({required this.timestampMs, required this.location, required this.crop, required this.status, required this.alarmList});
}

class Alarm {
  final int timestampMs;
  final String code;
  final AlarmLevel level;
  final String description;

  Alarm({required this.timestampMs, required this.code, required this.level, required this.description});
}

class Location {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});
}
