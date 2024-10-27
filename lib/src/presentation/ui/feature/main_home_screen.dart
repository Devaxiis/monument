import 'package:easy_localization/easy_localization.dart';
import 'package:monumentuz/library.dart';
import 'package:monumentuz/src/presentation/ui/feature/home_screen.dart';
import 'package:monumentuz/src/presentation/ui/feature/profile_screen.dart';
import 'package:monumentuz/src/presentation/ui/feature/search_screen.dart';


class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  PageController pageController = PageController();

  String home = "Home";
  String search = "Search";
  String bookmark = "Bookmark";
  String profile = "Profile";
  int index = 0;

  @override
  void initState() {
    super.initState();
    context.read<MainNavigationBloc>().add(MainNavigatorUserEvent(index: 0));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (context.locale == const Locale("uz", "UZ")) {
      home = "Bosh sahifa";
      search = "Qidiruv";
      bookmark = "Saqlanganlar";
      profile = "Kabinet";
    } else {
      home = "Home";
      search = "Search";
      bookmark = "Bookmark";
      profile = "Profile";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainNavigationBloc, MainNavigationState>(
      listener: (context, state) {
        if (state is MainNavigationSuccess) {
          index = state.index;
          pageController.jumpToPage(state.index);
        }
      },
      child: BlocBuilder<MainNavigationBloc, MainNavigationState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.colorE8DFCD,
            body: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                HomeScreen(),
                SearchScrren(),
                // BookMarkScreen(),
                ProfileScreen(),
              ],
            ),


            bottomNavigationBar: BlocBuilder<MainNavigationBloc,
                MainNavigationState>(
              builder: (context, state) {
                return GNav(
                    onTabChange: (value) {
                      // pageController.jumpToPage(value);
                      context.read<MainNavigationBloc>().add(
                          MainNavigatorUserEvent(index: value));
                    },
                    selectedIndex: index,
                    rippleColor: Colors.grey,
                    hoverColor: Colors.grey,
                    haptic: true,
                    curve: Curves.linear,
                    duration: const Duration(milliseconds: 700),
                    color: Colors.grey,
                    gap: 5,
                    activeColor: AppColors.colorFFFFFF,
                    iconSize: 24,
                    backgroundColor: AppColors.color045646,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    tabs: [
                      GButton(
                        icon: Icons.home,
                        text: home,
                      ),
                      GButton(
                        icon: Icons.search,
                        text: search,
                      ),
                      // GButton(
                      //   icon: Icons.bookmark,
                      //   text: bookmark,
                      // ),
                      GButton(
                        icon: Icons.person,
                        text: profile,
                      )
                    ]);
              },
            ),
          );
        },
      ),
    );
  }
}

