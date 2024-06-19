
import 'package:monumentuz/library.dart';

class SearchCardWidget extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  final double height;
  final bool read;

  const SearchCardWidget({super.key, required this.controller, required this.width, required this.height, required this.read, });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: AppColors.color045646,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: TextField(
        controller: controller,
        readOnly: read,
        onChanged: (value){
          if(value.length >= 3){
          context.read<SearchManumentBloc>().add(SearchManumentUserEvent(title:value));
          }
        },
        style: const TextStyle(
          color: AppColors.colorFFFFFF,
        ),
        cursorColor: AppColors.colorFFFFFF,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          prefixIconColor: AppColors.colorFFFFFF,
          hintText: "......",
          hintStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.colorFFFFFF
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide.none
          )
        ),
      )
    );
  }
}
