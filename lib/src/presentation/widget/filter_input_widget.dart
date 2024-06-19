

import 'package:easy_localization/easy_localization.dart';
import 'package:monumentuz/src/utils/style/style_util.dart';

import '../../../library.dart';

class FilterInputWidget extends StatelessWidget {
  final bool focus;
  final String label;
  final TextEditingController controller;
  final TextInputAction inputAction;
  final Function(String title) onSubmit;
  const FilterInputWidget({super.key, required this.focus, required this.label, required this.controller, required this.inputAction, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return TextField(
    autofocus: focus,
    controller: controller,
    textInputAction: inputAction,
    keyboardType: TextInputType.number,
    onSubmitted:(title)=> onSubmit(title),
    decoration: InputDecoration(
    labelText: label.tr(),
    labelStyle: StyleUtil.filterInputLabelStyle,
    border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(
    color: AppColors.color045646, width: 2)),
    enabled: true,
    enabledBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(
    color: AppColors.colorFFFFFF, width: 2)),
    focusedBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(
    color: AppColors.color045646, width: 2))),
    );
  }
}
