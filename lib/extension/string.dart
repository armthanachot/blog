import 'package:flutter/material.dart';

extension StringExt on String {
  Text text() {
    return Text(this);
  }

  Text textWithStyle(TextStyle style) {
    return Text(this, style: style);
  }
}
