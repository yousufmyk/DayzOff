import 'package:dayzoff/features/dataModels/employeeModel.dart';
import 'package:dayzoff/features/utils/textStyle.dart';

import 'package:dayzoff/features/home/ui/calenderDatePickerScreen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewRequestScreen extends StatelessWidget {
  const NewRequestScreen({super.key, required this.employeeData});
  final EmployeeData? employeeData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_circle_left_outlined,
                      size: 40,
                    )),
                Text(
                  'New Leave Request',
                  style: boldTextStyle(
                    22,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      //Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_circle_left_outlined,
                      size: 40,
                      color: Colors.transparent,
                    )),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            CalendarWidget(
              employeeData: employeeData,
            )
          ],
        ),
      ),
    );
  }
}
