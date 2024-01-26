import 'package:flutter/material.dart';
import 'package:pricer/constans.dart';
import 'package:pricer/core/widgets/custom_num_box.dart';
import 'package:pricer/core/widgets/custom_text_field.dart';

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
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 16,
                          right: 16,
                          left: 16,
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Add Project',
                            style:
                                TextStyle(fontSize: 26, color: Colors.white70),
                          ),
                          const Divider(
                            indent: 85,
                            endIndent: 85,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          CustomTextBox(
                            formKey: _formKeys[0],
                            controller: _controllers[0],
                            text: 'Project name',
                            iconData: Icons.pending,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextBox(
                            formKey: _formKeys[1],
                            controller: _controllers[1],
                            iconData: Icons.account_circle,
                            text: 'Client name',
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomNumBox(
                            formKey: _formKeys[2],
                            controller: _controllers[2],
                            text: 'Price per hour',
                            iconData: Icons.paid,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(150, 30),
                                  backgroundColor: kSecond2Color),
                              onPressed: () {
                                bool isValid = true;
                                for (var formKey in _formKeys) {
                                  if (!(formKey.currentState!.validate())) {
                                    isValid = false;

                                    /*  ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text('Processing Data'))); */
                                  }
                                }

                                // If all forms are valid, perform further actions
                                if (isValid) {
                                  Navigator.of(context).pop();
                                }
                              },
                              child: const Text(
                                'Add √',
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          child: const Icon(Icons.add_circle),
        ),
      ),
    );
  }
}
