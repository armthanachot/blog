import 'package:flutter/material.dart';

extension PaddingExt on Widget {
  p20() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: this,
    );
  }

  p5() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: this,
    );
  }

  p10() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: this,
    );
  }

  pCustom({double? top, double? bottom, double? left, double? right}) {
    return Padding(
      padding: EdgeInsets.only(
        top: top ?? 0,
        bottom: bottom ?? 0,
        left: left ?? 0,
        right: right ?? 0,
      ),
      child: this,
    );
  }

  ph20() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: this,
    );
  }

  pt(int value) {
    return Padding(
      padding: EdgeInsets.only(top: value.toDouble()),
      child: this,
    );
  }
}
