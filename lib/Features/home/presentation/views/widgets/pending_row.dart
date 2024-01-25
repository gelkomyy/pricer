import 'package:flutter/material.dart';
import 'package:pricer/Features/pending_projects/presentation/views/pending_projects_view.dart';
import 'package:pricer/core/utils/check_screen_view.dart';

class PendingRow extends StatelessWidget {
  const PendingRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isPendingView(context)
          ? MainAxisAlignment.center
          : MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Pending Projects',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        isPendingView(context)
            ? const SizedBox()
            : InkWell(
                onTap: () {
                  Navigator.pushNamed(context, PendingProjectsView.id);
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
