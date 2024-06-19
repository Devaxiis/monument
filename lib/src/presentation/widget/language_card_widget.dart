import 'package:easy_localization/easy_localization.dart';
import '../../../library.dart';

class LanguageCardWidget extends StatelessWidget {
  final Color color;
  final Color langColor;
  final TextStyle? style;
  const LanguageCardWidget({super.key, required this.color, required this.langColor,  required this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
      color: color,
        borderRadius: const BorderRadius.all(Radius.circular(15))
      ),
      child: ListTile(
        leading: const Icon(Icons.translate,color: AppColors.color045646,),
          title: Text("lang",style: style,).tr(),
          trailing:DropdownButton(
            alignment: Alignment.centerRight,
            underline: const SizedBox(),
            iconEnabledColor: langColor,
            items: const [
              DropdownMenuItem(value: 'en',child: Text("English"),) ,
              DropdownMenuItem(value: 'uz',child: Text("Uzbek"),) ,
            ],
            onChanged: (Object? value) {
              if (value == "en") {
                context.setLocale(const Locale("en","EN"));
              }else{
                context.setLocale(const Locale("uz","UZ"));
              }
            },
          )
      ),
    );
  }
}
