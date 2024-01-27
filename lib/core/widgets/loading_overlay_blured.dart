import 'dart:ui';

import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  final Color color;

  LoadingOverlay({
    required this.child,
    required this.isLoading,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        isLoading
            ? Stack(
                children: [
                  AbsorbPointer(
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 1.3, sigmaY: 1.3),
                      child: Container(
                          color: color,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: child),
                    ),
                  ),
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
