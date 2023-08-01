import 'package:flutter/material.dart';

import 'package:gostradav1/app/ui/pages/kategori/lainnya/lainnya.dart';
import 'package:sizer/sizer.dart';

import '../../../theme/color.dart';

import '../akademik/akademik2.dart';

import '../keuangan/keuanganv2.dart';

import '../nonakademik/nonakademik2.dart';

class Lainnyav2Page extends StatefulWidget {
  @override
  State<Lainnyav2Page> createState() => _Lainnyav2PageState();
}

class _Lainnyav2PageState extends State<Lainnyav2Page>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tc = TabController(length: 4, vsync: this);
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.78,
        padding: EdgeInsets.all(0.sp),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.sp, left: 0.sp),
                  child: TabBar(
                    labelPadding: EdgeInsets.only(bottom: 0.sp),
                    labelColor: DataColors.primary800,
                    unselectedLabelColor: DataColors.primary,
                    controller: tc,
                    indicator: RoundedTabIndicator(
                        color: DataColors.primary700,
                        height: 5.sp,
                        width: 15.sp,
                        borderRadius: 20),
                    // indicatorColor: DataColors.primary700,
                    tabs: [
                      Text(
                        "Semua",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 10.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 4.sp),
                        child: Text(
                          "Keuangan",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 10.sp),
                        ),
                      ),
                      Text(
                        "Akademik",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 10.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 0.sp, bottom: 15.sp),
                        child: Text(
                          "Non Akademik",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 10.sp),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
            // SizedBox(height: 5.sp,),
            Expanded(
              child: TabBarView(
                controller: tc,
                children: [
                  LainnyaPage(),
                  KategoriPage2(),
                  AkademikPage2(),
                  NonAkademikPage2(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final double centerX = offset.dx + cfg.size!.width / 2;
    final double centerY = offset.dy + cfg.size!.height / 1.5;

    canvas.drawCircle(Offset(centerX, centerY), radius, paint);
  }
}

class RoundedTabIndicator extends Decoration {
  final Color color;
  final double height;
  final double width;
  final double borderRadius;

  RoundedTabIndicator({
    required this.color,
    required this.height,
    required this.width,
    required this.borderRadius,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _RoundedPainter(
      color: color,
      height: height,
      width: width,
      borderRadius: borderRadius,
    );
  }
}

class _RoundedPainter extends BoxPainter {
  final Color color;
  final double height;
  final double width;
  final double borderRadius;

  _RoundedPainter({
    required this.color,
    required this.height,
    required this.width,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Rect rect = Rect.fromLTWH(
      offset.dx + (cfg.size!.width - width) / 2.1,
      offset.dy + (cfg.size!.height - height) / 1.2,
      width,
      height,
    );

    final RRect roundedRect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(borderRadius),
    );

    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawRRect(roundedRect, paint);
  }
}
