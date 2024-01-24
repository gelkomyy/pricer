import 'package:flutter/material.dart';
import 'package:pricer/Features/home/presentation/views/widgets/custom_add_floating_butoon.dart';
import 'package:pricer/Features/home/presentation/views/widgets/custom_home_scroll_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: CustomHomeScrollView(),
        ),
        CustomAddFloatingButton(),
      ],
    );
  }
}
