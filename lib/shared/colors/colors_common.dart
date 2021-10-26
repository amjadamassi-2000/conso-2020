import 'package:flutter/material.dart';

const defaultColor = Color(0xff2175BD);
const defaultHint = Color(0xffBCBCBC);
const defaultHint2 = Color(0xffF0EAF3);
const defaultHint3 = Color(0xffF7F5F7);
const defaultBorder = Color(0xffE4E4E4);
const defaultTextColor = Color(0xff757575);
const backgroundColor = Color(0xffF5F5F5);
const statusWaitingPreview = Color(0xffD97B00);

Map<int, Color> color =
{
  50:Color.fromRGBO(136,14,79, .1),
  100:Color.fromRGBO(136,14,79, .2),
  200:Color.fromRGBO(136,14,79, .3),
  300:Color.fromRGBO(136,14,79, .4),
  400:Color.fromRGBO(136,14,79, .5),
  500:Color.fromRGBO(136,14,79, .6),
  600:Color.fromRGBO(136,14,79, .7),
  700:Color.fromRGBO(136,14,79, .8),
  800:Color.fromRGBO(136,14,79, .9),
  900:Color.fromRGBO(136,14,79, 1),
};

MaterialColor defaultMaterialColor = MaterialColor(0xff2175BD, color);