import 'package:get/get.dart';
import 'package:gostradav1/app/controllers/auth/auth_c.dart';
import 'package:gostradav1/app/controllers/dashboard/dashboard_c.dart';
import 'package:gostradav1/app/controllers/library/library_c.dart';
import 'package:gostradav1/app/controllers/nonakademik/softskill/softskill_c.dart';
import 'package:gostradav1/app/controllers/onboard/onboard_c.dart';
import 'package:gostradav1/app/controllers/splashC/splash_c.dart';

import '../controllers/notifikasi/notifikasi_c.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<OnboardController>(() => OnboardController());
    Get.put(AuthController());
    
    Get.put(SoftSkillController());
    Get.put(NotifikasiController());
    
  }
}
