import 'package:flutter/material.dart';

class CustomAddFloatingButton extends StatelessWidget {
  const CustomAddFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 10),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add_circle),
        ),
      ),
    );
  }
}
