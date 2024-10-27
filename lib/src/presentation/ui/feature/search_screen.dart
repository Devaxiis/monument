import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:monumentuz/library.dart';
import '../../widget/search_card_widget.dart';
import 'detail_screen.dart';

class SearchScrren extends StatefulWidget {
  const SearchScrren({super.key});

  @override
  State<SearchScrren> createState() => _SearchScrrenState();
}

class _SearchScrrenState extends State<SearchScrren> {
  TextEditingController _textEditingController = TextEditingController();


  List<AllManumentDataDataList?> data = [];
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorE8DFCD,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "search",
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
    BlocListener<SearchManumentBloc, SearchManumentState>(
        listener: (context, state) {
          if (state is SearchManumentLoading) {
            isloading = true;
          }
          if (state is SearchManumentSuccess) {
            isloading = false;
            data = state.data.content;
          }
        },
  ),

  ],
  child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  isloading == true?const Center (child: CircularProgressIndicator(),):
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SearchCardWidget(
                          read: false,
                          controller: _textEditingController,
                          height: 50,
                          width: MediaQuery.sizeOf(context).width * 0.9,
                        ),
                      ),
                      BlocBuilder<SearchManumentBloc, SearchManumentState>(
                        builder: (context, state) {
                          return SizedBox(
                            height: MediaQuery.sizeOf(context).height,
                            child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (_, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: SearchCardWidgetList(
                                    data: data[index],
                                    onTab: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (_) =>
                                              DetailScreen(item: data[index],)));
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.color045646,
        onPressed: () {
          log(_textEditingController.text);
          context.read<SearchManumentBloc>().add(SearchManumentUserEvent(
              title: _textEditingController.text.trim()));
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
