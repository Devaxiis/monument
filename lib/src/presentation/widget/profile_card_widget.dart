import 'package:easy_localization/easy_localization.dart';
import 'package:monumentuz/library.dart';

class ProfileCardWidget extends StatelessWidget {

  String title;
  IconData icon;
  ProfileCardWidget({super.key, required this.title,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          color: AppColors.colorFFFFFF,
          borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child: ListTile(
          leading: Icon(icon,color: AppColors.color045646,),
          title: Text(title,style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.color045646,
            fontFamily: 'Ancient'
          ),).tr(),
        ));
  }
}
