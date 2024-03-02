import 'package:dayzoff/features/constants/constants.dart';
import 'package:flutter/material.dart';

import '../utils/textStyle.dart';

// ignore: must_be_immutable
class CloseRequestWidget extends StatelessWidget {
  CloseRequestWidget({
    required this.appliedDate,
    required this.asignStatus,
    required this.idNum,
    super.key,
  });

  String idNum;
  String appliedDate;
  String asignStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: orangeColor,
        ),
        child: Column(
          children: [
            ListTile(
              // tileColor: orangeColor,
              leading: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/dayzoff-c2455.appspot.com/o/Screenshot_2024-02-12_at_7.14.35_PM-removebg-preview.png?alt=media&token=2e90aae7-c1f9-44da-902a-c4b8d5b399ac'),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.green,
                    ),
                    child: Center(
                      child: Text(
                        'New',
                        style: boldTextStyle(
                          8,
                          
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'ID#$idNum',
                    style: boldTextStyle(13,),
                  )
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text('🗓️ Applied On:',
                          style: boldTextStyle(10, )),
                      Text(
                        appliedDate,
                        style: normalTextStyle(10, ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text('Status:', style: boldTextStyle(10, )),
                      Text(
                        asignStatus,
                        style: normalTextStyle(10, ),
                      )
                    ],
                  ),
                ],
              ),
              trailing: PopupMenuButton(
                color: grayColor,
                shadowColor: Colors.white,
                position: PopupMenuPosition.under,
                icon: const ImageIcon(
                  NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/dayzoff-c2455.appspot.com/o/Screenshot_2024-02-12_at_8.26.19_PM-removebg-preview.png?alt=media&token=46038ca2-8b9b-4ec9-83eb-6f56671ab31a'),
                  color: Colors.black,
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                      child: ListTile(
                    leading: const Icon(
                      Icons.edit_square,
                      color: Colors.greenAccent,
                    ),
                    title: Text(
                      'Eidt',
                      style: boldTextStyle(15, ),
                    ),
                  )),
                  PopupMenuItem(
                      child: ListTile(
                    leading: const Icon(
                      Icons.delete_outline_rounded,
                      color: Colors.redAccent,
                    ),
                    title: Text(
                      'Delete',
                      style: boldTextStyle(15,),
                    ),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
