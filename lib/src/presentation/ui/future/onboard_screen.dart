import 'package:easy_localization/easy_localization.dart';
import 'package:monumentuz/library.dart';
import 'package:monumentuz/src/utils/custom_widget/ui_toast.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController _pageController = PageController();
  TextEditingController textEditingController = TextEditingController();
  int index = 0;
  String text = "next";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            // onPageChanged: (value){
            //   index = value;
            //   text ="next";
            //   if(index == 2){
            //     text="save";
            //   }
            //   setState(() {});
            // },
            controller: _pageController,
            // physics: const NeverScrollableScrollPhysics(),
            children: [
              Stack(
                children: [
                  SizedBox(
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                      child: const Image(image: AssetImage("assets/images/img_monument24.jpg",),fit: BoxFit.fitHeight,)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('discover',style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.w400,
                          color: AppColors.color045646,
                          fontFamily: "Ancient"
                      ),).tr(),
                      const Text('discover2',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: AppColors.color045646,
                        fontFamily: "Ancient",
                      ),
                        textAlign: TextAlign.center,
                      ).tr(),
                    ],
                  ),
                ],
              ),
              Stack(
                children: [
                  SizedBox(
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                      child: const Image(image: AssetImage("assets/images/img_ona.jpg",),fit: BoxFit.fitHeight,)),
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('experiance',style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w400,
                          color: AppColors.color045646,
                          fontFamily: "Ancient"
                      ),).tr(),
                      const Text('experiance2',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: AppColors.color045646,
                        fontFamily: "Ancient",
                      ),
                        textAlign: TextAlign.center,
                      ).tr(),
                    ],
                  ),
                ],
              ),
              LanguageScreen(textEditingController: textEditingController,),
            ],
          ),


          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              color: AppColors.colorE8DFCD,
            alignment: Alignment.center,
            child: InkWell(
              onTap: (){
                if(index < 2){
                  index += 1;
                  text ="next";
                  if(index == 2){
                    text="save";
                  }
                }else{
                  if(textEditingController.text == "" ){
                    UiToast.uiToastBottom("please", context);
                  }else{
                    repo.setUser(textEditingController.text);
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=> const MainHomeScreen()), (route) => false);
                  }
                }
                _pageController.jumpToPage(index);
                setState(() {});
              },
              child: Container(
                height: 64,
                width: 350,
                decoration: const BoxDecoration(
                  color: AppColors.color045646,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                alignment: Alignment.center,
                child: Text(text,style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.colorFFFFFF,
                  fontFamily: "Ancient"
                ),).tr(),
              ),
            ),
            ),

          ),
        ],
      ),
    );
  }
}
