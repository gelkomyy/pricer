import 'package:flutter/material.dart';
import 'package:pricer/Features/project_details/presentation/views/project_details_view.dart';
import 'package:pricer/constans.dart';
import 'package:pricer/core/models/project_model.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem(
      {super.key,
      this.iconData = Icons.hourglass_bottom,
      required this.projectModel});
  final IconData iconData;
  final ProjectModel projectModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kSecondColor,
      ),
      height: 160,
      width: 210,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Icon(
              iconData,
              color: kSecond3Color,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              projectModel.projectName,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              projectModel.clientName,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 30,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kSecond3Color,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProjectDetailsView(projectModel: projectModel);
                      }));
                    },
                    child: const Text(
                      'View',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                Text(
                  '${projectModel.totalPrice.toString()}' r'$',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
