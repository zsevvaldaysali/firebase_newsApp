import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_news/product/constants/color_constants.dart';
import 'package:kartal/kartal.dart';

class WavyBoldText extends StatelessWidget {
  const WavyBoldText({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        WavyAnimatedText(
          title,
          textStyle: context.textTheme.headlineSmall?.copyWith(
            color: ColorConsts.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
