
import 'package:monumentuz/library.dart';

abstract class Apptheme{
  static ThemeData get light{
    return ThemeData(
        appBarTheme:const AppBarTheme(
            elevation: 0,
            color: AppColors.color045646
        ),
        scaffoldBackgroundColor: AppColors.colorE8DFCD,
        splashColor: Colors.transparent,
        fontFamily: "Ancient",
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black)
    );
  }
  static ThemeData get dark{
    return ThemeData(
        appBarTheme:const AppBarTheme(
            elevation: 0,
            color: AppColors.color045646
        ),
        scaffoldBackgroundColor: AppColors.colorE8DFCD,
        splashColor: Colors.transparent,
        fontFamily: "Ancient",
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black)
    );
  }
}