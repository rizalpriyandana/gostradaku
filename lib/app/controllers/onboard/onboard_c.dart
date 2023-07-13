import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardController extends GetxController {
  var isViewed = false;

  @override
  void onInit() {
    final box = GetStorage();
    box.write('isViewed', true);
    super.onInit();
  }
}
