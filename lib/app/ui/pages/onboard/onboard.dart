import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/controllers/onboard/onboard_c.dart';
import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBaoard extends StatelessWidget {
  final c = Get.find<OnboardController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: IntroductionScreen(
        isTopSafeArea: true,
        isBottomSafeArea: true,
        // globalBackgroundColor: DataColors.blusky,
        pages: pages,
        onDone: () {
          Get.offAllNamed(RoutName.login);
        },
        onSkip: () {
          Get.offAllNamed(RoutName.login);
        },
        showBackButton: false,
        showSkipButton: true,
        skip: const Text("Skip", style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Text("Next", style: TextStyle(fontWeight: FontWeight.w600)),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.black,
            color: Colors.black26,
            spacing:
                const EdgeInsets.only(left: 3.0, right: 3.0, bottom: 100.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }

  final pages = [
    PageViewModel(
      titleWidget: const Text(""),
      decoration: const PageDecoration(
        bodyAlignment: Alignment.topCenter,
      ),
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text("Selamat datang",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24)),
          Text("di Go- Strada",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24)),
          SizedBox(height: 20),
          Image(image: AssetImage('assets/images/onboard/e3.png')),
          // SizedBox(height: 50),
          Text("Usap untuk lebih lanjut"),
        ],
      ),
    ),
    PageViewModel(
      titleWidget: const Text(''),
      decoration: const PageDecoration(
        bodyAlignment: Alignment.topCenter,
      ),
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "Reminder To Go",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          Image(image: AssetImage('assets/images/onboard/a3.png')),
          Text(
            "Dengan fitur reminder, mempermudah anda dalam mengetahui tugas-tugas yang ditugaskan nantinya",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    PageViewModel(
      titleWidget: const Text(""),
      decoration: const PageDecoration(
        bodyAlignment: Alignment.topCenter,
      ),
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text("Easy Access",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24)),
          Image(image: AssetImage('assets/images/onboard/c3.png')),
          Text(
            "Mudahkan pengerjaan tugas anda dengan Go-Strada yang mudah diakses 24/7",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  ];
}
