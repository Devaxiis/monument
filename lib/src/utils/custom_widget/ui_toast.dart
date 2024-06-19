import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monumentuz/library.dart';

class UiToast {

  static uiToastBottom (String txt,BuildContext context){
    return ScaffoldMessenger.maybeOf(context)?.showSnackBar(
        SnackBar(
          backgroundColor: AppColors.color045646,
            duration: const Duration(milliseconds: 700),
            content: Text(txt,style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.colorFFFFFF,
                fontFamily: "Ancient",
    ),).tr()));
  }


}
