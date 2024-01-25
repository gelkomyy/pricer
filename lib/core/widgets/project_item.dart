import 'package:flutter/material.dart';
import 'package:pricer/constans.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key, this.iconData = Icons.hourglass_bottom});
  final IconData iconData;
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
            const Text(
              'Name Of Project',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Client Name',
              style: TextStyle(
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
                    onPressed: () {},
                    child: const Text(
                      'View',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const Text(
                  r'70$',
                  style: TextStyle(
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
