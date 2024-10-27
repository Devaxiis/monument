import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:monumentuz/library.dart';
import 'package:monumentuz/src/presentation/ui/feature/edit__profile.dart';
import 'package:monumentuz/src/presentation/ui/feature/logout_screen.dart';
import 'package:monumentuz/src/presentation/ui/feature/about_screen.dart';
import 'package:monumentuz/src/presentation/widget/language_card_widget.dart';
import 'package:monumentuz/src/presentation/widget/profile_card_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
 String name = "";
 String image = "";

 @override
  void initState() {
    super.initState();
    name = repo.readUser();
    image = repo.readUserImg();
    log(image);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorE8DFCD,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(name,style: StyleUtil.profileName,textAlign: TextAlign.center,),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  height: 160,
                  width: 180,
                  alignment: Alignment.center,
                  decoration:  BoxDecoration(
                    color: AppColors.color045646,
                    image:DecorationImage(image: AssetImage(image),fit: BoxFit.cover) ,
                    shape: BoxShape.circle
                  ),
                ),
              ),
              Card(
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>  EditProfile(name: name,)));
                  },
                  child: Container(
                    height: 45,
                    width: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                    child: Center(
                      child: const Text("edit_profile",style: StyleUtil.profileEditStyle,).tr(),
                    ),
                  ),
                ),
              ),
              // GestureDetector(
              //     onTap: (){
              //       context.read<MainNavigationBloc>().add(const MainNavigatorUserEvent(index: 2));
              //     },
              //     child: ProfileCardWidget(title: "saves",icon: Icons.bookmark_border_rounded,)),
              const LanguageCardWidget(color: AppColors.colorFFFFFF, langColor: AppColors.color045646,style: StyleUtil.profeLanuageStyle,),
              GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const AboutScreen()));
                  },
                  child: ProfileCardWidget(title: "about",icon: Icons.info_outline_rounded,)),
              InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const LogOutScreen()));
                  },
                  child: ProfileCardWidget(title: "logout",icon: Icons.logout,)),

            ],
          ),
        ),
      ),
    );
  }

  // Future _onPickImage()async{
  //   final responseImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  //        _selctedImage = File(responseImage!.path);
  //   setState(() {});
  // }
}
