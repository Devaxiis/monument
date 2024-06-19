// import 'package:easy_localization/easy_localization.dart';
// import 'package:monument/library.dart';
//
// import '../../widget/filter_input_widget.dart';
//
// class FilterScreen extends StatefulWidget {
//   const FilterScreen({super.key});
//
//   @override
//   State<FilterScreen> createState() => _FilterScreenState();
// }
//
// class _FilterScreenState extends State<FilterScreen> {
//   TextEditingController controllerBegin = TextEditingController();
//   TextEditingController controllerEnd = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Text(
//           "filter",
//           style: TextStyle(
//             fontFamily: "Ancient",
//             fontSize: 23,
//             fontWeight: FontWeight.w600,
//             color: AppColors.colorFFFFFF,
//           ),
//         ).tr(),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//         child: Stack(
//           alignment: Alignment.topCenter,
//           children: [
//             SizedBox(
//               height: MediaQuery.sizeOf(context).height,
//               child: ListView.builder(
//                 itemCount: 10,
//                 itemBuilder: (_, index) {
//                   return Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 10),
//                       child: Container(
//                         height: 50,
//                         color: AppColors.color045646,
//                       )
//                       // BookMarkCardWidget(data: data[index], onTab: () {
//                       // Navigator.of(context).push(MaterialPageRoute(
//                       //     builder: (_) =>
//                       //         DetailScreen(item: data[index],))
//                       );
//                 },
//               ),
//             ),
//             Container(
//               decoration: const BoxDecoration(
//                   color: AppColors.colorFFFFFF,
//                   borderRadius: BorderRadius.all(Radius.circular(10))),
//               child: Row(
//                 children: [
//                   Expanded(
//                       child:FilterInputWidget(focus: true,label: "begin",controller: controllerBegin,)),
//                   const SizedBox(width: 5),
//                   Expanded(
//                       child: FilterInputWidget(focus: false, label: "end", controller: controllerEnd)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//
//         },
//         backgroundColor: AppColors.color045646,
//         child: Icon(Icons.search,color: AppColors.colorFFFFFF,),
//       ),
//     );
//   }
// }
