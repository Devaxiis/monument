import 'package:flutter/material.dart';
import 'package:monumentuz/library.dart';

class FilterCardWidget extends StatelessWidget {
  const FilterCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.color045646,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: const SizedBox(
          height: 24,
          width: 24,
          child: Image(image: AssetImage("assets/icons/ic_filter.png"),)),
    );
  }
}
