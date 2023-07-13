import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../theme/color.dart';

class dashboardbutton extends StatelessWidget {
  final String getto;
  const dashboardbutton({
    Key? key,
    required this.getto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridCol(
      xs: 3,
      md: 2,
      child: InkWell(
        onTap: () => Get.toNamed(getto),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: DataColors.blusky,
                    borderRadius: BorderRadius.circular(30)),
                child: SvgPicture.asset(
                    'assets/images/dashboard/icon/penawarankrs.svg')),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Akademik',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: DataColors.primary700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
