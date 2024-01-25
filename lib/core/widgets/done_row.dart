import 'package:flutter/material.dart';
import 'package:pricer/Features/completed_projects/presentation/views/completed_projects_view.dart';
import 'package:pricer/constans.dart';
import 'package:pricer/core/utils/check_screen_view.dart';

class DoneRow extends StatelessWidget {
  const DoneRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isCompletedView(context)
          ? MainAxisAlignment.center
          : MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Completed Projects',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        isCompletedView(context)
            ? const SizedBox()
            : InkWell(
                onTap: () {
                  Navigator.pushNamed(context, CompletedProjectsView.id);
                },
                child: const Text(
                  'See all',
                  style: TextStyle(
                    color: kSecond2Color,
                    fontSize: 20,
                  ),
                ),
              ),
      ],
    );
  }
}
