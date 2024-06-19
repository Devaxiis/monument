import 'package:easy_localization/easy_localization.dart';
import '../../../library.dart';

class BookMarkCardWidget extends StatelessWidget {
  final AllManumentDataDataList? data;
  final Function() onTab;
  final Function() onTab2;
  const BookMarkCardWidget({super.key, this.data, required this.onTab, required this.onTab2});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: onTab,
      child: Container(
        height: 160,
        width: width,
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
                      height: height,
                      width: width,
                      child: Image(image: NetworkImage("${Apis.baseImgUrl}${data?.attachments[0 ].contentURL}"),fit: BoxFit.cover,)),
                )),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                          width: width * 0.4,
                          child: Text(context.locale == const Locale("en","EN")?data!.nameEng :data!.nameUz,overflow: TextOverflow.ellipsis,)),
                      IconButton(onPressed: onTab2,
                          icon: const Icon(Icons.delete_outlined,color: AppColors.color045646,))
                    ],
                  ),
                  SizedBox(
                      height: 85,
                      width: MediaQuery.sizeOf(context).width,
                      child:  Text(context.locale == const Locale("en","EN")?data!.descriptionEng:data!.descriptionUz,overflow: TextOverflow.fade,)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
