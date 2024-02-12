import 'package:dayzoff/features/constants/constants.dart';
import 'package:dayzoff/features/dataModels/employeeModel.dart';
import 'package:dayzoff/features/utils/textStyle.dart';
import 'package:dayzoff/features/widgets/requestWidget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.employeeData});
  final EmployeeData? employeeData;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 3, vsync: this, initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: orangeColor,
        child: const Icon(
          Icons.mode_edit_outline_outlined,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " Hi ${widget.employeeData!.preferredName} ! 👋",
                  style: boldTextStyle(22, Colors.white),
                ),
                PopupMenuButton(
                  color: orangeColor,
                  shadowColor: Colors.white,
                  position: PopupMenuPosition.under,
                  //icon: const Icon(Icons.account_circle_outlined,size: 33,),
                  icon: ClipOval(
                      // radius: 23,
                      child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/dayzoff-c2455.appspot.com/o/5A06B5C2-9357-494D-A707-5CDCF05547BB_1_105_c.jpeg?alt=media&token=cdc60511-41d1-4b24-b1d3-9b3132ec063f',
                    fit: BoxFit.fill,
                    height: 40,
                    width: 40,
                  )),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Icon(
                          Icons.person_2_outlined,
                          color: Colors.white,
                        ),
                        title: Text('Profile'),
                      ),
                    ),
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Icon(
                          Icons.mode_night_outlined,
                          color: Colors.white,
                        ),
                        title: Text('Dark Mode'),
                        //trailing: Switch(),
                      ),
                    ),
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Icon(
                          Icons.settings_outlined,
                          color: Colors.white,
                        ),
                        title: Text('Settings'),
                      ),
                    ),
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Icon(
                          Icons.logout_rounded,
                          color: Colors.white,
                        ),
                        title: Text('Log Out'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            TabBar(
              indicatorColor: orangeColor,
              labelColor: orangeColor,
              controller: tabController,
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(
                  text: 'Pending',
                ),
                Tab(
                  text: 'Closed',
                ),
                Tab(
                  text: 'Rejected',
                ),
              ],
            ),
            
            Expanded(
              child: TabBarView(

                  //dragStartBehavior: DragStartBehavior.down,
                  controller: tabController,
                  children: <Widget>[
                    Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, snapshot) {
                                return RequestWidget(
                                  idNum: '10233310',
                                  appliedDate: '12-02-2024',
                                  asignStatus: 'Superviso',
                                );
                              }),
                        )
                      ],
                    ),
                    const Text('This is 2'),
                    const Text('This is 3'),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
