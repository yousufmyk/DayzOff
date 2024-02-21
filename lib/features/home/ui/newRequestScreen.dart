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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios_new_rounded)),
            Text('This is the new request Screen')
          ],
        ),
      ),
    );
  }
}