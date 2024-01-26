import 'package:flutter/material.dart';
import 'package:pricer/constans.dart';

class ProjectDetailsViewBody extends StatelessWidget {
  const ProjectDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.hourglass_bottom,
                color: kSecond3Color,
                size: 36,
              ),
              Card(
                color: kSecond3Color,
                child: Icon(
                  Icons.edit,
                  color: kPrimaryColor,
                  size: 38,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Name Of Project',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Client Name',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              r'50$',
              style: TextStyle(fontSize: 50, color: Color(0xff008000)),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Card(
            surfaceTintColor: kSecondColor,
            elevation: 17,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(105)),
            color: kSecondColor,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '00:00',
                  style: TextStyle(
                    fontSize: 90,
                  ),
                ),
                Text(
                  ':00',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              r'Price per hour: 5$',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          const Spacer(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                color: kSecond3Color,
                child: Icon(
                  Icons.refresh,
                  color: kPrimaryColor,
                  size: 35,
                ),
              ),
              Icon(
                Icons.stop_circle,
                color: kSecond3Color,
                size: 80,
              ),
              Card(
                color: kSecond3Color,
                child: Icon(
                  Icons.check,
                  color: kPrimaryColor,
                  size: 45,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
