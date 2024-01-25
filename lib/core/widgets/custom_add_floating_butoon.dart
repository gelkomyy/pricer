import 'package:flutter/material.dart';
import 'package:pricer/constans.dart';
import 'package:pricer/core/widgets/custom_num_box.dart';
import 'package:pricer/core/widgets/custom_search_box.dart';
import 'package:pricer/core/widgets/custom_text_field.dart';

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
                          const CustomTextBox(
                            text: 'Project name',
                            iconData: Icons.pending,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const CustomTextBox(
                            iconData: Icons.account_circle,
                            text: 'Client name',
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const CustomNumBox(
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
                                Navigator.of(context).pop();
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
