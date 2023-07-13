import 'package:get/get.dart';

class DetailTransaksiController extends GetxController {
  onclick(bool input) {
    if (input == false) {
      input = true;
      update();
      return input;
    } else {
      input = false;
      update();
      return input;
    }
  }
}
