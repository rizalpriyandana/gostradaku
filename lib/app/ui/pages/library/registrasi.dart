import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/library/library_c.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Registrasi extends StatefulWidget {
  @override
  State<Registrasi> createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  final _isLoading = true.obs;
  LibraryController lc = Get.find<LibraryController>();
  final box = GetStorage();
  late Map data = box.read("dataUser") as Map<String, dynamic>;
  WebViewController? _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            setState(() {
              _isLoading.value = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading.value = false;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
          Uri.parse('https://lib.strada.ac.id/index.php?p=daftar_online'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DataColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Registrasi",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              color: DataColors.primary800),
        ),
        leading: Padding(
          padding: EdgeInsets.only(top: 11.sp, left: 10.sp),
          child: GestureDetector(
            onTap: () {
              lc.allbook(data['nim']);
              Get.back();
            } ,
            child: FaIcon(
              FontAwesomeIcons.angleLeft,
              color: DataColors.primary800,
              size: 18.sp,
            ),
          ),
        ),
      ),
      body: Obx(
        () => _isLoading.isTrue
            ? Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                    color: DataColors.primary700, size: 40.sp))
            : WebViewWidget(controller: _controller!),
      ),
    );
  }
}
