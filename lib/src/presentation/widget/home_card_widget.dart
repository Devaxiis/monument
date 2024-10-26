
import 'package:easy_localization/easy_localization.dart';
import 'package:monumentuz/library.dart';

class HomeCardWidget extends StatelessWidget {
  final AllManumentDataDataList? data;
  final Function() onTab;
  const HomeCardWidget({super.key, required this.data, required this.onTab});

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.sizeOf(context).height;
    final _width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: onTab,
      child: Container(
        height: 160,
        width: _width,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: AppColors.colorFFFFFF,
          borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child:  Row(
          children: [
            Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: SizedBox(
                      height: _height,
                      width: _width,
                      child:  Image(image: NetworkImage("${Apis.baseImgUrl}${data!.attachments[0].contentURL}"),fit: BoxFit.cover,)),
                )),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      SizedBox(
                          width: _width * 0.5,
                          child: Text(context.locale == const Locale("en","EN")?data!.nameEng :data!.nameUz,overflow: TextOverflow.ellipsis,)),
                      // IconButton(onPressed: (){
                      //   log("W01");
                      //   context.read<SaveBookmarkBloc>().add(SaveBookmarkUserEvent(data: data!));
                      // }, icon: const Icon(Icons.bookmark_border,color: AppColors.color045646,))
                    ],
                  ),
                  SizedBox(
                      height: 85,
                      width: MediaQuery.sizeOf(context).width,
                      child:  Text(context.locale == const Locale("en","EN")?"${data!.descriptionEng}":"${data!.descriptionUz}",overflow: TextOverflow.fade,)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
