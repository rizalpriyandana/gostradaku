import 'package:get/get.dart';

class BottomNavigationController extends GetxController{
  var selectedIdex = 0.obs;

  void tappedIndex(int index){
    selectedIdex.value = index;
  }
}