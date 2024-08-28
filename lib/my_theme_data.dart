import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor=const Color(0xff121312);
  static Color greyColor=const Color(0xff282A28);
  static Color yellowColor=const Color(0xffF7B539);
  static Color whiteColor=const Color(0xffFFFFFF);
  static Color greyText=const Color(0xffCBCBCB);
  static Color navigateColor=const Color(0xff1A1A1A);
  static Color iconColor=const Color(0xffB5B4B4);
  static Color greyContainer=const Color(0xff343534);

  static ThemeData lightTheme=ThemeData(
      textTheme:TextTheme(
        titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize:22,
            color:whiteColor),
        titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color:whiteColor,
            fontSize:18),
        titleSmall: TextStyle(
            fontWeight:FontWeight.w500,
            fontSize:15,
            color:greyText),
      ),

      bottomNavigationBarTheme:BottomNavigationBarThemeData(
          type:BottomNavigationBarType.fixed,
          unselectedLabelStyle: TextStyle(
              fontSize:11,
              fontWeight: FontWeight.bold
          ),

          selectedLabelStyle:TextStyle(
              fontSize:11,
              fontWeight: FontWeight.bold
          ),

          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor:yellowColor,
          unselectedItemColor: iconColor
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: greyColor,
      )
  );
}