import 'package:flutter/material.dart';
import 'package:myblog/theme/app_color.dart';

class AppDecoration {
    static BoxDecoration bg = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [AppColor.secondary, AppColor.primary],
    ),
  );
}

