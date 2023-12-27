import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

class ErrorSnackbar{
final String info;

  ErrorSnackbar({required this.info}); 
  static show(BuildContext context, String info) {
    snackBar(
      context,
      backgroundColor: Colors.transparent,
      elevation: 0,  
      content: CustomSnackBar.error(
                        message:
                            info,
                      ),
    );
  }
  
  

}