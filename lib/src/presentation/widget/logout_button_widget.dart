import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LogOutButtonWidget extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color backgrounColor;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  const LogOutButtonWidget({super.key, required this.text, required this.backgrounColor, this.border, required this.style, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 350,
      decoration: BoxDecoration(
          color: backgrounColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: border
      ),
      alignment: Alignment.center,
      child: Text(text,style: style).tr(),
    );
  }
}
