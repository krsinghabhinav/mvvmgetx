import 'package:get/get.dart';
import 'package:mvvmgetx/view/news/news_main_home_screen.dart';
import 'package:mvvmgetx/view/news/pages/articals/articals.dart';
import 'package:mvvmgetx/view/news/pages/profilescreen.dart';

class BottomNavController extends GetxController {
  final RxInt isSelected = 0.obs;

  // updateSelected(int index) {
  //   isSelected.value = index;
  // }

  List pages = [
    NewsMainHomeScreen(),
    ArticalsScreen(),
    Profilescreen(),
  ];
}
