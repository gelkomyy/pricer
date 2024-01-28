import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pricer/core/models/time_model.dart';
part 'time_counter_state.dart';

class TimeCounterCubit extends Cubit<TimeCounterState> {
  late final Timer _timer;
  // Initialize the timer in the constructor
  TimeCounterCubit(this.secondsCount) : super(TimeCounterInitial()) {
    emit(TimeCounterUpdate(getFormattedTime()));
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      // Emit the elapsed time periodically
      emit(TimeCounterUpdate(getFormattedTime()));
    });
  }

  int secondsCount;
  bool counterIsRunning = false;
  TimeModel getFormattedTime({bool isReset = false}) {
    if (counterIsRunning) {
      secondsCount += 1;
    }
    if (isReset) {
      secondsCount = 0;
    }

    var milli = secondsCount * 1000;
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
    //   secondsCount = setcount;
    if (counterIsRunning) {
      stopTime();
    } else {
      counterIsRunning = true;
      emit(TimeCounterPlay());
    }
  }

  stopTime() {
    counterIsRunning = false;
    emit(TimeCounterStop());
  }

  resetTime() {
    //  stopwatch.reset();
    emit(TimeCounterUpdate(getFormattedTime(isReset: true)));
    emit(TimeCounterReset());
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
