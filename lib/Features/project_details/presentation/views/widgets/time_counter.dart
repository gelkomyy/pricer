import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer/Features/home/presentation/manager/manage_database_projects_cubit/manage_projects_cubit.dart';
import 'package:pricer/Features/project_details/presentation/manager/time_counter_cubit/time_counter_cubit.dart';
import 'package:pricer/constans.dart';
import 'package:pricer/core/models/project_model.dart';
import 'package:pricer/core/models/time_model.dart';

class TimeCounter extends StatefulWidget {
  const TimeCounter({
    super.key,
    required this.projectModel,
  });
  final ProjectModel projectModel;

  @override
  State<TimeCounter> createState() => _TimeCounterState();
}

class _TimeCounterState extends State<TimeCounter> {
  TimeModel? timeModel = TimeModel(hours: 0, minutes: 0, seconds: 0);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimeCounterCubit, TimeCounterState>(
      listener: (context, state) {
        if (state is TimeCounterUpdate) {
          timeModel = state.timeModel;
          widget.projectModel.hours =
              timeModel!.hours ?? widget.projectModel.hours;
          widget.projectModel.minutes =
              timeModel!.minutes ?? widget.projectModel.minutes;

          num totalHours =
              ((widget.projectModel.hours * 60) + widget.projectModel.minutes) /
                  60;

          widget.projectModel.totalPrice =
              totalHours * widget.projectModel.pricePerHour;

          if (_timer == null || _timer!.isActive == false) {
            _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
              BlocProvider.of<ManageProjectsCubit>(context)
                  .editProject(widget.projectModel);
            });
          }
        }
      },
      builder: (context, state) {
        return Card(
          surfaceTintColor: kSecondColor,
          elevation: 17,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(105)),
          color: kSecondColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${timeModel?.hours.toString().padLeft(2, '0')}:${timeModel?.minutes.toString().padLeft(2, '0')}' ??
                    '00:00',
                style: const TextStyle(
                  fontSize: 90,
                ),
              ),
              Text(
                ':${timeModel?.seconds.toString().padLeft(2, '0')}' ?? ':00',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
