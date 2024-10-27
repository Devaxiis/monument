import 'package:easy_localization/easy_localization.dart';
import 'package:monumentuz/library.dart';
import 'package:monumentuz/src/presentation/widget/logout_button_widget.dart';


class LogOutScreen extends StatefulWidget {
  const LogOutScreen({super.key});

  @override
  State<LogOutScreen> createState() => _LogOutScreenState();
}

class _LogOutScreenState extends State<LogOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 4),
               Container(
                 height: 250,
                 width: 250,
                 // padding: EdgeInsets.all(20),
                 alignment: Alignment.center,
                 decoration: const BoxDecoration(
                   color: AppColors.color045646,
                   shape: BoxShape.circle
                 ),
                 child: const SizedBox(
                     height: 100,
                     width: 100,
                     child: Image(image: AssetImage("assets/icons/ic_logout.png"),fit: BoxFit.cover,)),
               ),
            const Spacer(flex: 2),
            const Text("really_title",style: StyleUtil.logOutTitleStyle,textAlign: TextAlign.center,).tr(),
            const Spacer(flex: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: (){
                  repo.deleteUser();
                  repo.deleteUserImg();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=> const OnboardScreen()), (route) => false);
                },
                child: LogOutButtonWidget(text: "really", backgrounColor: Colors.transparent, style: StyleUtil.logOutButtonOneStyle,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    width: 2,
                    color: AppColors.color045646,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: const LogOutButtonWidget(text: "really2", backgrounColor: AppColors.colorFFFFFF, style: StyleUtil.logOutButtonTwoStyle,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const Spacer(flex: 4),

          ],
        ),
      ),
    );
  }
}
