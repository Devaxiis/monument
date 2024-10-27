import 'package:monumentuz/library.dart';
import 'package:easy_localization/easy_localization.dart';


class LanguageScreen extends StatelessWidget {
 final TextEditingController textEditingController;
  const LanguageScreen({super.key, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorE8DFCD,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("name",style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Ancient",
                    color: AppColors.color045646
                  ),).tr(),
                  SizedBox(
                    height: 60,
                    child: TextField(
                      autofocus: true,
                      controller: textEditingController,
                      decoration: const InputDecoration(
                        hintText: "Ismingizni kiriting!",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                          borderSide: BorderSide(
                            color: AppColors.color045646,
                            width: 2,
                          )
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              color: AppColors.color045646,
              child: ListTile(
                leading: const Text("lang",style: TextStyle(
                  color: AppColors.colorFFFFFF,
                  fontFamily: 'Ancient',
                  fontWeight: FontWeight.w600,
                  fontSize: 15
                ),).tr(),
                trailing:DropdownButton(
                  alignment: Alignment.centerRight,
                  underline: const SizedBox(),
                  iconEnabledColor: AppColors.colorFFFFFF,
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
            )
          ],
        ),
      ),
    );
  }
}
