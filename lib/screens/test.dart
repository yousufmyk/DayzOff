import 'package:dayzoff/widgets/snackBar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.success(
                        message:
                            "Good job, your release is successful. Have a nice day",
                      ),
                    );
                  },
                  child: Text('Sucess')),
              ElevatedButton(
                  onPressed: () {
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.error(
                        message:
                            "Something went wrong. Please check your credentials and try again",
                      ),
                    );
                  },
                  child: Text('Error')),
              ElevatedButton(
                  onPressed: () {
                    // snackBar(
                    //   context,
                    //   backgroundColor: Colors.transparent,
                    //   elevation: 0,
                    //   content: CustomSnackBar.error(
                    //     message:
                    //         "Something went wrong. Please check your credentials and try again",
                    //   ),
                    // );
                    ErrorSnackbar(info: 'hello');
                  },
                  child: Text('Bottom'))
            ],
          ),
        ),
      ),
    );
  }
}
