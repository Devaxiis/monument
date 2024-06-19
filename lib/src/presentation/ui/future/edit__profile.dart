import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:monumentuz/src/utils/constants/3d_image.dart';
import 'package:monumentuz/src/utils/custom_widget/ui_toast.dart';

import '../../../../library.dart';

class EditProfile extends StatefulWidget {
  final String name;
  const EditProfile({super.key, required this.name});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController textEditingController= TextEditingController();
  String image ="";
  int item = 0;
  @override
  Widget build(BuildContext context) {
    textEditingController.text = widget.name;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Edit profile",style: StyleUtil.bookmarkAppBarStyle,),
        actions: [
          IconButton(onPressed: (){
            repo.setUserImg(Image3D.iamge[item]);
            repo.setUser(textEditingController.text);
            UiToast.uiToastBottom("save_img", context);
            Navigator.of(context).pop();
            context.read<MainNavigationBloc>().add(const MainNavigatorUserEvent(index: 0));
          }, icon: const Icon(Icons.save_alt,color: AppColors.colorFFFFFF,))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              SizedBox(
                height: 100,
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("name2",style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Ancient",
                        color: AppColors.color045646
                    ),).tr(),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 60,
                      child: TextField(
                        // autofocus: true,
                        controller: textEditingController,
                        decoration: const InputDecoration(
                            hintText: "......",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(13)),
                                borderSide: BorderSide(
                                  color: AppColors.color045646,
                                  width: 2,
                                )
                            ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(13)),
                              borderSide: BorderSide(
                                color: AppColors.color045646,
                                width: 2,
                              )
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Text("choose",style: StyleUtil.aboutScreenStyle,).tr(),
              const SizedBox(height: 30),
              SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: MasonryGridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    itemCount: Image3D.iamge.length,
                    itemBuilder: (context,index){
                      image = Image3D.iamge[index];
                      return InkWell(
                        onTap: (){
                          item = index;
                          setState(() {});
                        },
                        child: Container(
                          height: 100,
                          width: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover),
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border:item == index ? Border.all(
                              width: 3,
                              color: AppColors.color045646
                            ):null,
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
