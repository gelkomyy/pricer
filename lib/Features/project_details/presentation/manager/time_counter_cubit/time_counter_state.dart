part of 'time_counter_cubit.dart';

@immutable
sealed class TimeCounterState {}

final class TimeCounterInitial extends TimeCounterState {}

final class TimeCounterDone extends TimeCounterState {}

final class TimeCounterReset extends TimeCounterState {}

final class TimeCounterPlay extends TimeCounterState {}

final class TimeCounterStop extends TimeCounterState {}

final class GetTimeCounterDone extends TimeCounterState {}

class TimeCounterUpdate extends TimeCounterState {
  final TimeModel timeModel;

  TimeCounterUpdate(this.timeModel) : super();
}
