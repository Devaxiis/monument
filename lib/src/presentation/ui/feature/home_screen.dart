import 'package:easy_localization/easy_localization.dart';
import 'package:monumentuz/library.dart';
import 'package:monumentuz/src/presentation/ui/feature/detail_screen.dart';
import 'package:monumentuz/src/presentation/widget/home_card_widget.dart';
import 'package:monumentuz/src/utils/custom_widget/ui_toast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controllerBegin = TextEditingController();
  TextEditingController controllerEnd = TextEditingController();
  List<AllManumentDataDataList?> data = [];

  @override
  void initState() {
    super.initState();
    context.read<AllManumentDataListBloc>().add(AllManumentDataListUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorE8DFCD,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "home",
          style: TextStyle(
            fontFamily: "Ancient",
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: AppColors.colorFFFFFF,
          ),
        ).tr(),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AllManumentDataListBloc, AllManumentDataListState>(
            listener: (context, state) {
              if (state is AllManumentDataListFailure) {
                UiToast.uiToastBottom("error", context);
              }
              if (state is AllManumentDataListSuccess) {
                data = state.data;
              }
            },
          ),
          BlocListener<BetweenBloc, BetweenState>(
            listener: (context, state) {
              if (state is BetweenSuccess) {
                data = state.data;
              }
              if (state is BetweenFailure) {
                UiToast.uiToastBottom(state.message, context);
              }
            },
          ),

        ],
        child: BlocBuilder<BetweenBloc, BetweenState>(
          builder: (context, state) {
            return SafeArea(
              child: BlocBuilder<AllManumentDataListBloc,
                  AllManumentDataListState>(
                builder: (context, state) {
                  if (state is AllManumentDataListLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.color045646,
                      ),
                    );
                  } else if (state is AllManumentDataListFailure) {
                    UiToast.uiToastBottom("error", context);
                  }
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  context.read<MainNavigationBloc>().add(
                                      const MainNavigatorUserEvent(index: 1));
                                },
                                child: Container(
                                  height: 50,
                                  width: MediaQuery.sizeOf(context).width * 0.7,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: const BoxDecoration(
                                      color: AppColors.color045646,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.search,
                                        color: AppColors.colorFFFFFF,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Monument nomini kiriting!",
                                        style: TextStyle(
                                            color: AppColors.colorFFFFFF),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    BottomSheetFuture.bottomSheetWidget(
                                        context,
                                        400,
                                        MediaQuery.sizeOf(context).width,
                                        AppColors.colorFFFFFF,
                                        controllerBegin,
                                        controllerEnd);
                                    // Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const FilterScreen()));
                                  },
                                  child: const FilterCardWidget()),
                            ],
                          ),
                        ),
                        // const SizedBox(height: 10),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       const Text("popular",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.color000000),).tr(),
                        //       TextButton(onPressed: (){}, child: const Text("more",style: TextStyle(
                        //         fontSize: 12,
                        //         fontWeight: FontWeight.w400,
                        //         color: AppColors.color045646
                        //       ),).tr())
                        //     ],
                        //   ),
                        // ),
                        // const SizedBox(height: 15),
                        // CarouselCardWidget(list: list,),
                        // const SizedBox(height: 10),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height,
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: HomeCardWidget(
                                  data: data[index],
                                  onTab: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (_) => DetailScreen(
                                                  item: data[index],
                                                )));
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
