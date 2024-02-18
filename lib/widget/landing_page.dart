import 'package:flutter/material.dart';
import 'package:myblog/extension/padding.dart';
import 'package:myblog/module/blog.dart';
import 'package:myblog/pkg/constant/assets.dart';
import 'package:myblog/pkg/utils/navigator.dart';
import 'package:myblog/theme/app_color.dart';
import 'package:myblog/theme/decoration.dart';
import 'package:slide_to_act/slide_to_act.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.bg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(AssetConst.myBlogLogoNoBg),
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 40),
          SlideAction(
                  borderRadius: 20,
                  innerColor: AppColor.orange,
                  outerColor: AppColor.secondary,
                  onSubmit: () async {
                    RouteNavigator.push(context, const Blog());
                  },
                  text: 'Slide to Continue',
                  textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.orange))
              .p20(),
        ],
      ),
    );
  }
}
