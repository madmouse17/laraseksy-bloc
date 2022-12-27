import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class Pallete {
  static const Color bgolor = Color(0xffF4F1F1);
  static const Color boxLoginColor = Color(0xff9ED2C6);
  static const Color boxLoginAccentColor = Color(0xff54BAB9);
  static const Color primaryColor = Color(0xff54BAB9);
  static const Color primaryDarkColor = Color(0xff094949);
  static const Color secondaryColor = Color(0xff9ED2C6);
  static const Color tertiaryColor = Color(0xffE9DAC1);
  static const Color tertiarySecondaryColor = Color(0xffF7ECDE);
  static const Color tertiaryDarkColor = Color(0xffB37D23);

  static const Color greyDarkColor = Color(0xff585858);
  static const Color redAccentColor = Color(0xffF29595);
}

Map<int, Color> color = const {
  50: Color.fromRGBO(84, 186, 185, .1),
  100: Color.fromRGBO(84, 186, 185, .2),
  200: Color.fromRGBO(84, 186, 185, .3),
  300: Color.fromRGBO(84, 186, 185, .4),
  400: Color.fromRGBO(84, 186, 185, .5),
  500: Color.fromRGBO(84, 186, 185, .6),
  600: Color.fromRGBO(84, 186, 185, .7),
  700: Color.fromRGBO(84, 186, 185, .8),
  800: Color.fromRGBO(84, 186, 185, .9),
  900: Color.fromRGBO(84, 186, 185, 1),
};
MaterialColor colorCustom = MaterialColor(0xFF54BAB9, color);
