import 'package:flutter/material.dart';
import 'package:weather_app/utils/primary_color.dart';

ThemeData appTheme = ThemeData(
  primarySwatch: primary,
  fontFamily: 'Poppins'
);

const primaryColor = Color(0xFFAC736A);
const transparent = Colors.transparent;
const textLightBrown = Color(0xFFF6C8A4);
const white = Color(0xFFFFFFFF);


const poppins25 = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    color: textLightBrown);
const poppins63 =  TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 63,
    color: textLightBrown);
const poppins13 =  TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 13,
    color: textLightBrown);
const poppins10 =  TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: textLightBrown);
const poppins15 =  TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: white);
const poppins20 =  TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: white);