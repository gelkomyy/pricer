import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pricer/core/models/time_model.dart';

part 'time_counter_state.dart';

class TimeCounterCubit extends Cubit<TimeCounterState> {
  // Initialize the timer in the constructor
  TimeCounterCubit() : super(TimeCounterInitial()) {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      // Emit the elapsed time periodically
      emit(TimeCounterUpdate(getFormattedTime()));
    });
  }
  late final Timer _timer;
  Stopwatch stopwatch = Stopwatch();
  TimeModel getFormattedTime() {
    var milli = stopwatch.elapsed.inMilliseconds;
    int seconds = (milli ~/ 1000) % 60;
    int minutes = ((milli ~/ 1000) ~/ 60) % 60;
    int hours = ((milli ~/ 1000) ~/ 3600);
    return TimeModel(
      hours: hours,
      minutes: minutes,
      seconds: seconds,
    );
  }

  playTime() {
    if (stopwatch.isRunning) {
      stopTime();
    } else {
      stopwatch.start();
      emit(TimeCounterPlay());
    }
  }

  stopTime() {
    stopwatch.stop();
    emit(TimeCounterStop());
  }

  resetTime() {
    stopwatch.reset();
    emit(TimeCounterReset());
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
