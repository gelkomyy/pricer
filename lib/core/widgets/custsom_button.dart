import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.text,
    required this.textStyle,
    required this.borderRadius,
  });
  final Color backgroundColor;
  final String text;
  final TextStyle textStyle;
  final BorderRadiusGeometry borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 150,
      child: Material(
        color: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        child: InkWell(
          customBorder: RoundedRectangleBorder(borderRadius: borderRadius),
          onTap: () {},
          child: Center(
            child: Text(
              text,
              selectionColor: backgroundColor,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
