import 'package:flutter/material.dart';

class RouteNavigator {
  static void pushReplacement(BuildContext context, Widget widget) =>
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      );

  static void pop<T>(BuildContext context, [T? result]) =>
      Navigator.pop(context, result);

  static void push(BuildContext context, Widget widget, [Function? callback]) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => widget))
          .then((val) {
        (callback != null) ? callback(val) : null;
      });
}
