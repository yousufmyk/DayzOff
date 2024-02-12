  import 'package:flutter/material.dart';
  import 'package:google_fonts/google_fonts.dart';

TextStyle boldTextStyle(double size,Color color,){
  return GoogleFonts.poppins(fontSize: size,color: color, fontWeight: FontWeight.bold);
}
TextStyle normalTextStyle(double size,Color color,){
  return GoogleFonts.poppins(fontSize: size,color: color, fontWeight: FontWeight.normal);
}
// TextStyle appstyleForMsg(double size,Color color, FontWeight fw){
//   return GoogleFonts.montserrat(fontSize: size,color: color, fontWeight: fw);
// }