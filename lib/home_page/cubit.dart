import 'package:bloc/bloc.dart';
import 'package:untitled/enum.dart';
import 'package:untitled/models/robot.dart';
import 'package:untitled/robot.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(super.initialState);

  fetchRobots() async {
    emit(HomeLoading());
    await Future.delayed(const Duration(seconds: 2));
    final data = List.from(robotsJson);
    final robots = data.map((r) {
      return Robot(
        serial: r['serial'] ?? 'na',
        history: List.from(
          (r['history'] ?? []).map((h) {
            return History(
              timestampMs: h['timestampMs'] ?? 0,
              location: Location(latitude: h['location']['latitude'] ?? 0.0, longitude: h['location']['longitude'] ?? 0.0),
              crop: h['crop'] ?? 'na',
              alarmList: List.from(
                (h['alarmList'] ?? []).map((a) {
                  return Alarm(
                    timestampMs: a['timestampMs'] ?? 0,
                    code: a['code'] ?? 'na',
                    level: getAlarmLevelFromString(a['level'] ?? 'na'),
                    description: a['description'] ?? 'na',
                  );
                }),
              ),
              status: getStatusFromString(h['status'] ?? 'na'),
            );
          }),
        ),
      );
    });
    emit(HomeLoaded(robots.toList()));
  }
}

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Robot> listRobots;

  HomeLoaded(this.listRobots);
}
