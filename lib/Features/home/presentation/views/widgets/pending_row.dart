import 'package:flutter/material.dart';

class PendingRow extends StatelessWidget {
  const PendingRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Pending Projects',
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
