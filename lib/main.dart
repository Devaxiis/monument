import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monumentuz/app.dart';
import 'package:monumentuz/src/injector.dart';

late String? user;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await serviceLocator();
  user = repo.readUser();
  runApp(EasyLocalization(
    supportedLocales: const [Locale("en", "EN"), Locale("uz", "UZ"),],
    path: "assets/translation",
    fallbackLocale: const Locale("uz", "UZ"),
    child: const MyApp(),
  ),);
}


