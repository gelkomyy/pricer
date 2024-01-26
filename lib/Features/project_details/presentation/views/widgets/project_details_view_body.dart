import 'package:flutter/material.dart';
import 'package:pricer/Features/project_details/presentation/views/widgets/custom_project_details_bar.dart';
import 'package:pricer/Features/project_details/presentation/views/widgets/manage_time_buttons.dart';
import 'package:pricer/Features/project_details/presentation/views/widgets/time_counter.dart';

class ProjectDetailsViewBody extends StatelessWidget {
  const ProjectDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomProjectDetailsBar(),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Name Of Project',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Client Name',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              r'50$',
              style: TextStyle(fontSize: 50, color: Color(0xff008000)),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          TimeCounter(),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              r'Price per hour: 5$',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Spacer(),
          ManageTimeButtons(),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
