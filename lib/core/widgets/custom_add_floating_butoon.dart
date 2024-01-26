import 'package:flutter/material.dart';
import 'package:pricer/constans.dart';
import 'package:pricer/core/widgets/modal_bottom_sheet_widget.dart';

class CustomAddFloatingButton extends StatefulWidget {
  const CustomAddFloatingButton({
    super.key,
  });

  @override
  State<CustomAddFloatingButton> createState() =>
      _CustomAddFloatingButtonState();
}

class _CustomAddFloatingButtonState extends State<CustomAddFloatingButton> {
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  final List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 10),
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: kPrimaryColor,
                useSafeArea: true,
                context: context,
                builder: (context) {
                  return ModalBottomSheetWidget(
                      formKeys: _formKeys, controllers: _controllers);
                });
          },
          child: const Icon(Icons.add_circle),
        ),
      ),
    );
  }
}
