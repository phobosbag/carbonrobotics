
enum Status {
  STATUS_ERROR,
  STATUS_ESTOPPED,
  STATUS_POWERED_DOWN,
  STATUS_WEEDING,
  STATUS_STANDBY,
}

enum AlarmLevel {
  CRITICAL,
  HIGH,
  MEDIUM,
  LOW,
}


Status getStatusFromString(String status) {
  switch (status) {
    case 'STATUS_ERROR':
      return Status.STATUS_ERROR;
    case 'STATUS_ESTOPPED':
      return Status.STATUS_ESTOPPED;
    case 'STATUS_POWERED_DOWN':
      return Status.STATUS_POWERED_DOWN;
    case 'STATUS_WEEDING':
      return Status.STATUS_WEEDING;
    case 'STATUS_STANDBY':
      return Status.STATUS_STANDBY;
    default:
      throw Exception('Unknown status: $status');
  }
}
AlarmLevel getAlarmLevelFromString(String level) {
  switch (level) {
    case 'CRITICAL':
      return AlarmLevel.CRITICAL;
    case 'HIGH':
      return AlarmLevel.HIGH;
    case 'MEDIUM':
      return AlarmLevel.MEDIUM;
    case 'LOW':
      return AlarmLevel.LOW;
    default:
      throw Exception('Unknown alarm level: $level');
  }
}