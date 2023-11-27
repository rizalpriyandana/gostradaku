import 'package:get/get.dart';
import 'package:gostradav1/app/controllers/auth/auth_c.dart';
import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final c = Get.find<AuthController>();
  final int timerSplash = 3;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: timerSplash), () async {
      final box = GetStorage();
      final isLoggedIn = box.read('isLoggedIn') ?? false;
      
      if (isLoggedIn) {
        // Jika sudah login sebelumnya, arahkan ke halaman Dashboard
        Get.offNamed(RoutName.root);
      } else {
        // Jika belum login, arahkan ke halaman Login
        Get.offNamed(RoutName.onboard);
      }
    });
  }
}
