import 'package:flutter/material.dart';
import 'package:pricer/Features/project_details/presentation/views/widgets/custom_project_details_bar.dart';
import 'package:pricer/Features/project_details/presentation/views/widgets/manage_time_buttons.dart';
import 'package:pricer/Features/project_details/presentation/views/widgets/time_counter.dart';
import 'package:pricer/core/models/project_model.dart';

class ProjectDetailsViewBody extends StatelessWidget {
  const ProjectDetailsViewBody({super.key, required this.projectModel});
  final ProjectModel projectModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomProjectDetailsBar(
            projectModel: projectModel,
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              projectModel.projectName,
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              projectModel.clientName,
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
              '${projectModel.totalPrice}' r'$',
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
              'Price per hour: ${projectModel.pricePerHour}' r'$',
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
