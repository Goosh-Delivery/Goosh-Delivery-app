import 'package:flutter/material.dart';

const Color primaryColor = Color(0xff282e6a);

const Color secondaryColor = Color(0xffff7900);

const Color bgColor = Color(0xff6f7f9);

const Color grey = Color(0xffe6e6e6);

const Color textColor = Color(0xff333333);

List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

const LargeTextSize = 26.0;
const MediumTextSize = 18.0;
const BodyTextSize = 16.0;

const String FontNameDefault = 'Tahoma';

const AppBarTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w500,
  fontSize: MediumTextSize,
  color: textColor,
);

const TitleTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: LargeTextSize,
  color: Colors.black,
);

const BoldTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w700,
  fontSize: BodyTextSize,
  color: Colors.black,
);

const DetailBoldText = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w700,
  fontSize: 24,
  color: Colors.black,
);
const ButtonTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: BodyTextSize,
  color: Colors.white,
);
