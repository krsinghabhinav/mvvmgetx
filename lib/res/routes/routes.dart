import 'package:get/get.dart';
import 'package:mvvmgetx/res/routes/routes_name.dart';
import 'package:mvvmgetx/view/home_screen.dart';
import 'package:mvvmgetx/view/login/login_view.dart';
import 'package:mvvmgetx/view/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashScreen,
            page: () => SplashScreen(),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RoutesName.loginView,
            page: () => LoginView(),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RoutesName.homeView,
            page: () => HomeScreen(),
            transition: Transition.leftToRightWithFade),
      ];
}
