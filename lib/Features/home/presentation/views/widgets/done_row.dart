import 'package:flutter/material.dart';

class DoneRow extends StatelessWidget {
  const DoneRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Completed Projects',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        InkWell(
          onTap: () {},
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
