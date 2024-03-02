import 'package:dayzoff/features/utils/textStyle.dart';
import 'package:flutter/material.dart';

class NewRequestScreen extends StatelessWidget {
  const NewRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      // flightShuttleBuilder: (flightContext, animation, flightDirection,
      //           fromHeroContext, toHeroContext) {
      //         switch (flightDirection) {
      //           case HeroFlightDirection.push:
      //             return Material(
      //               color: Colors.transparent,
      //               child: ScaleTransition(
      //                 scale: animation
      //                     .drive(Tween<double>(begin: 0.0, end: 0.0).chain(
      //                   CurveTween(curve: Curves.fastOutSlowIn),
      //                 )),
      //                 child: toHeroContext.widget,
      //               ),
      //             );

      //           case HeroFlightDirection.pop:
      //             return Material(
      //               color: Colors.transparent,
      //               child: fromHeroContext.widget,
      //             );
      //         }
      //       },
      tag: 'FloatingActionButtonAnimation',

      child: Scaffold(
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
                    style: boldTextStyle(22, ),
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
              // Szi
              // TextField(
              //   decoration: InputDecoration(
              //     focusColor: orangeColor,
              //     border: OutlineInputBorder(
              //       borderSide: BorderSide(

              //         width: 4
              //       )
              //     )
              //   ),
              //   maxLines: 10,

              // )
            ],
          ),
        ),
      ),
    );
  }
}
