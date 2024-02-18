
import 'package:flutter/material.dart';

class ScreenSize {
  static double fullH(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double fullW(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static Size get(BuildContext context) => MediaQuery.of(context).size;
}
