import 'package:easy_localization/easy_localization.dart';
import 'library.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AllManumentDataListBloc>(create: (context) => AllManumentDataListBloc(),),
        BlocProvider<MainNavigationBloc>(create: (context) => MainNavigationBloc(),),
        BlocProvider<SearchManumentBloc>(create: (context) => SearchManumentBloc(),),
        BlocProvider<BetweenBloc>(create: (context) => BetweenBloc(),),

      ],
      child: MaterialApp(
        theme: Apptheme.light,
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        home:  const SplashScreen(),
      ),
    );
  }
}
