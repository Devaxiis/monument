
import 'package:monumentuz/src/injector.dart';
import 'package:monumentuz/src/presentation/bloc/between/between_bloc.dart';
import 'package:monumentuz/src/utils/constants/colors.dart';
import 'package:monumentuz/src/utils/style/style_util.dart';

import '../../../library.dart';
import 'filter_input_widget.dart';

class BottomSheetFuture{

 static Future bottomSheetWidget(BuildContext context,double? height,double? width,Color? color,TextEditingController controllerBegin,TextEditingController controllerEnd)async{
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (index){
      return Padding(
        padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.all(20),
          decoration:  BoxDecoration(
             color: color,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
          ),
          child:  Column(
            
            children: [
              Row(
                children: [
                  Expanded(
                      child:FilterInputWidget(
                        focus: true,
                        label: "begin",
                        controller: controllerBegin,
                        inputAction: TextInputAction.next,
                        onSubmit: (title){},
                      )),
                  const SizedBox(width: 5),
                  Expanded(
                      child: FilterInputWidget(
                        focus: false,
                        label: "end",
                        controller: controllerEnd,
                        inputAction: TextInputAction.search,
                        onSubmit: (title){
                          context.read<BetweenBloc>().add(BetweenUserGetEvent(yearOne: controllerBegin.text, yearTwo:controllerEnd.text));
                          Navigator.pop(context);
                          },
                      )),
                ],
              ),
                 const SizedBox(height: 10),
                 InkWell(
                   onTap: (){
                     context.read<BetweenBloc>().add(BetweenUserGetEvent(yearOne: controllerBegin.text, yearTwo:controllerEnd.text));
                     Navigator.pop(context);
                   },
                   child: Container(
                     height: 50,
                     width: MediaQuery.sizeOf(context).width,
                     alignment: Alignment.center,
                     decoration: const BoxDecoration(
                       color: AppColors.color045646,
                       borderRadius: BorderRadius.all(Radius.circular(10))
                     ),
                     child: const Text("Search",style: StyleUtil.filterButtonSearchStyle,),
                   ),
                 ),
            ],
          ),
        ),
      );
    });
  }
}

