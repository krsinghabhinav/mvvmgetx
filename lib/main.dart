import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmgetx/firebase_options.dart';
import 'package:mvvmgetx/getx_localization/language.dart';
import 'package:mvvmgetx/res/routes/routes.dart';
import 'package:mvvmgetx/view/home_screen.dart';
import 'package:mvvmgetx/view/news/pages/homePages.dart';
import 'package:mvvmgetx/view/splash_screen.dart';

import 'animation/animation_home_page.dart';
import 'view/news/news_main_home_screen.dart';
import 'view/notestodo/create_notes_screen.dart';
import 'view/notestodo/notes_main_screen.dart';

void main() async {
  // Uncomment these lines if you need to generate the JWT on app start.
  // final authSigner = AuthSigner();
  // final jwt = authSigner.createJwt();
  // print('Generated JWT: $jwt');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Language(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      getPages: AppRoutes.appRoutes(),
      // initialRoute: SplashScreen(),
      home: AnimationHomePage(), // Ensure you define an initial route
    );
  }
}
