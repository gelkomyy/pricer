import 'package:flutter/material.dart';
import 'package:pricer/Features/completed_projects/presentation/views/completed_projects_view.dart';

class DoneRow extends StatelessWidget {
  const DoneRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          ModalRoute.of(context)?.settings.name == CompletedProjectsView.id
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Completed Projects',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        ModalRoute.of(context)?.settings.name == CompletedProjectsView.id
            ? const SizedBox()
            : InkWell(
                onTap: () {
                  Navigator.pushNamed(context, CompletedProjectsView.id);
                },
                child: const Text(
                  'See all',
                  style: TextStyle(
                    color: Color(0xffF47148),
                    fontSize: 20,
                  ),
                ),
              ),
      ],
    );
  }
}
