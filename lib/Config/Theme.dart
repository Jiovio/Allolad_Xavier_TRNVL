import 'package:flutter/material.dart';

import 'Color.dart';

class Themes {
    final lightTheme = ThemeData.light().copyWith(

          elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: PrimaryColor,
        foregroundColor: White
      )
    ),
      scaffoldBackgroundColor: White,
      canvasColor: White,
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: PrimaryColor,
        selectionColor: Blue800,
        selectionHandleColor: Blue800),
    appBarTheme: AppBarTheme(
      elevation: 5,
      shadowColor: Colors.grey[50],
      surfaceTintColor: White,
      // brightness: Brightness.light,
      titleTextStyle: TextStyle(
              color: Black, fontSize: 20, fontWeight: FontWeight.w600),
      // color: White,
      iconTheme: IconThemeData(
        color: Black,
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: PrimaryColor, width: 2.0)),
      labelColor: PrimaryColor,
      unselectedLabelColor: Black,
      indicatorSize: TabBarIndicatorSize.label,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Black800,
      selectedItemColor: PrimaryColor,
    ),


    brightness: Brightness.light,
    primaryColor: PrimaryColor,
    // hintColor: accentColor,

    colorScheme:const ColorScheme(
        primary: PrimaryColor,
        secondary: accentColor,
        surface: White,
        background: White,
        error: Colors.red,
        onPrimary: White,
        onSecondary: Black,
        onSurface: Black,
        onBackground: Black800,
        onError: Colors.red,
        brightness: Brightness.light,
        primaryContainer: Blue800,
        secondaryContainer: SecondaryColor),
    iconTheme: IconThemeData(color: PrimaryColor),
    // primaryColorBrightness: Brightness.light,
    primaryIconTheme: IconThemeData(color: PrimaryColor),
    timePickerTheme: TimePickerThemeData(
        dialHandColor: PrimaryColor,
        entryModeIconColor: PrimaryColor,
        backgroundColor: White),

        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: Black
          ),

          focusColor: Black,
          border: OutlineInputBorder(

          )

          
        )
        
  );

  final darkTheme = ThemeData.dark().copyWith(
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: SecondaryColor,
        selectionColor: Colors.blueAccent[50],
        selectionHandleColor: SecondaryColor),
    hoverColor: Colors.blueAccent[50],
    splashColor: SecondaryColor,
    tabBarTheme: TabBarTheme(
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: SecondaryColor, width: 2.0)),
      labelColor: White,
      unselectedLabelColor: Colors.white38,
      indicatorSize: TabBarIndicatorSize.label,
    ),
    
    timePickerTheme: TimePickerThemeData(
        dialHandColor: SecondaryColor,
        entryModeIconColor: SecondaryColor,
        backgroundColor: Colors.black),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkGrey2,
      unselectedItemColor: Colors.white38,
      selectedItemColor: SecondaryColor,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
              color: White, fontSize: 20, fontWeight: FontWeight.w600) ,
      color: darkGrey2,
      iconTheme: IconThemeData(
        color: White,
      ),
    ),
    colorScheme: ColorScheme(
        primary: SecondaryColor,
        secondary: accentColor,
        surface: Black,
        background: White,
        error: Colors.red,
        onPrimary: White,
        onSecondary: Black,
        onSurface: Black,
        onBackground: White,
        onError: Colors.red,
        brightness: Brightness.light,
        primaryContainer: Blue800,
        secondaryContainer: SecondaryColor),
    iconTheme: IconThemeData(color: Colors.grey),
    scaffoldBackgroundColor: darkGrey,
    brightness: Brightness.dark,
    primaryColor: darkGrey,
  );
}
