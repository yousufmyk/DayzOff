import 'package:dayzoff/features/constants/constants.dart';
import 'package:dayzoff/features/dataModels/employeeModel.dart';
import 'package:dayzoff/features/home/bloc/home_bloc.dart';
import 'package:dayzoff/features/utils/textStyle.dart';
import 'package:dayzoff/features/widgets/authButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({
    Key? key,
    required this.employeeData,
  }) : super(key: key);

  final EmployeeData? employeeData;

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _CalendarWidgetState createState() =>
      _CalendarWidgetState(employeeData: employeeData);
}

class _CalendarWidgetState extends State<CalendarWidget> {
  _CalendarWidgetState({required this.employeeData});
  final EmployeeData? employeeData;
  // ignore: non_constant_identifier_names
  TextEditingController FromdateController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController TodateController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController appliedDateController = TextEditingController();
  DatabaseReference ref = FirebaseDatabase.instance.ref("users");
  final HomeBloc homeBloc = HomeBloc();

  String id = DateTime.now().millisecondsSinceEpoch.toString();

  DateTime appliedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    FromdateController = TextEditingController();
    TodateController = TextEditingController();
    appliedDateController.text =
        '${appliedDate.day}-${appliedDate.month}-${appliedDate.year}';
    _updateDateController();
  }

  @override
  void dispose() {
    FromdateController.dispose();
    TodateController.dispose();
    reasonController.dispose();
    appliedDateController.dispose();
    super.dispose();
  }

  DateTime? _selectedDateFrom = DateTime.now();
  DateTime? _selectedDateTo = DateTime.now();

  void _updateDateController() {
    if (_selectedDateFrom != null) {
      FromdateController.text =
          '${_selectedDateFrom!.day}-${_selectedDateFrom!.month}-${_selectedDateFrom!.year}';
    } else {
      FromdateController.text = 'Select from date';
    }
    if (_selectedDateTo != null) {
      TodateController.text =
          '${_selectedDateTo!.day}-${_selectedDateTo!.month}-${_selectedDateTo!.year}';
    } else {
      TodateController.text = 'Select to date';
    }
  }

  Future<void> _selectDateFrom(BuildContext context) async {
    final DateTime? pickedFrom =
        await (Theme.of(context).platform == TargetPlatform.iOS
            ? showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 300,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: _selectedDateFrom ?? DateTime.now(),
                      onDateTimeChanged: (DateTime newDate) {
                        setState(() {
                          _selectedDateFrom = newDate;
                          _updateDateController();
                        });
                      },
                    ),
                  );
                },
              )
            : showDatePicker(
                context: context,
                initialDate: _selectedDateFrom ?? DateTime.now(),
                firstDate: DateTime(2015, 8),
                lastDate: DateTime(2101),
              ));
    if (pickedFrom != null && pickedFrom != _selectedDateFrom) {
      setState(() {
        _selectedDateFrom = pickedFrom;
        _updateDateController();
      });
    }
  }

  Future<void> _selectDateTo(BuildContext context) async {
    final DateTime? pickedTo =
        await (Theme.of(context).platform == TargetPlatform.iOS
            ? showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 300,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: _selectedDateFrom ?? DateTime.now(),
                      onDateTimeChanged: (DateTime newDate) {
                        setState(() {
                          _selectedDateTo = newDate;
                          _updateDateController();
                        });
                      },
                    ),
                  );
                },
              )
            : showDatePicker(
                context: context,
                initialDate: _selectedDateFrom ?? DateTime.now(),
                firstDate: DateTime(2015, 8),
                lastDate: DateTime(2101),
              ));
    if (pickedTo != null && pickedTo != _selectedDateFrom) {
      setState(() {
        _selectedDateTo = pickedTo;
        _updateDateController();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ID: $id",
                    style: boldTextStyle(
                      20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'From',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 50,
                            width: 130,
                            child: TextField(
                              controller: FromdateController,
                              readOnly: true,
                              onTap: () {
                                _selectDateFrom(context);
                              },
                              decoration: InputDecoration(
                                focusColor: orangeColor,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: orangeColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding: const EdgeInsets.all(14),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'To',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 50,
                            width: 130,
                            child: TextField(
                              controller: TodateController,
                              readOnly: true,
                              onTap: () {
                                _selectDateTo(context);
                              },
                              decoration: InputDecoration(
                                focusColor: orangeColor,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: orangeColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding: const EdgeInsets.all(14),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reason',
                        style: boldTextStyle(
                          13,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        // onTapOutside: (event) {

                        // },
                        controller: reasonController,
                        minLines: 10,
                        maxLines: 15,
                        cursorColor: orangeColor,
                        decoration: InputDecoration(
                          //ocusColor: Colors.orange,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: orangeColor,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                          alignLabelWithHint: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: AuthButton(
                      onTap: () {
                        // print(FromdateController.text);
                        // print(TodateController.text);
                        // print(appliedDateController.text);

                        // await ref.child(id).set({
                        //   "fromdate": FromdateController.text,
                        //   "todare": TodateController.text,
                        //   "reason": reasonController.text,
                        // });
                        homeBloc.add(
                          AddNewRequestToTheDbEvent(
                            id: id,
                            fromDate: FromdateController.text,
                            toDate: TodateController.text,
                            reason: reasonController.text,
                            appliedDate: appliedDate.toString(),
                            employeeData: employeeData,
                          ),
                        );
                        //print(employeeData!.fullName);
                      },
                      text: 'Submit',
                      radious: 8,
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
