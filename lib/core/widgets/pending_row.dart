import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer/Features/home/presentation/manager/manage_database_projects_cubit/manage_projects_cubit.dart';
import 'package:pricer/Features/pending_projects/presentation/views/pending_projects_view.dart';
import 'package:pricer/constans.dart';
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
                    color: kSecond2Color,
                    fontSize: 20,
                  ),
                ),
              ),
      ],
    );
  }
}
