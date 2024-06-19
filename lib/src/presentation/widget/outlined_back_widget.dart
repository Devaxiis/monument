import '../../../library.dart';

class OutlinedBackWidget extends StatelessWidget {
  final IconData icon;
  final Function() onTab;
  const OutlinedBackWidget({super.key, required this.icon, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        height: 42,
        width: 42,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
                width: 1.2,
                color: AppColors.colorE8DFCD
            )
        ),
        child: Icon(icon,color: AppColors.colorE8DFCD,),
      ),
    );
  }
}
