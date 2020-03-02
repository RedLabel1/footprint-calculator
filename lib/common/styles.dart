import 'package:flutter/material.dart';

ThemeData agresteLightTheme() => ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.lightBlue[600],
    accentColor: Colors.lightBlue[600],
    primaryColorDark: Colors.lightBlue[800],
    primaryTextTheme: TextTheme(
      headline1: _headline1(),
      bodyText1: _bodyText1(),
    ),
    buttonTheme: _buttonTheme());

TextStyle _headline1() => TextStyle(
      color: Colors.blueGrey[600],
      fontSize: 22,
      fontWeight: FontWeight.w300,
    );

TextStyle _bodyText1() => TextStyle(
      color: Colors.blueGrey[600],
      fontSize: 18,
      fontWeight: FontWeight.w300,
    );

ButtonThemeData _buttonTheme() => ButtonThemeData(
    height: 60,
    minWidth: 200,
    buttonColor: Colors.lightBlue[600],
    disabledColor: Colors.blueGrey[600],
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)));
