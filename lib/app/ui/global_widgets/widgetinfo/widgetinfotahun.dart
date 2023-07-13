// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:sizer/sizer.dart';

class WidgetInfoTahun extends StatelessWidget {
  // const WidgetInfo({
  //   Key? key,
  // }) : super(key: key);
  final String tahun;

  WidgetInfoTahun({
    Key? key,
    required this.tahun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 28.sp,
          width: 28.sp,
          padding: EdgeInsets.all(0.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.sp),
            color: DataColors.primary700,
            // boxShadow: ,
          ),
          child: Padding(
            padding: EdgeInsets.all(5.sp),
            child: Image.asset('assets/icon/calendar.png', height: 30.sp, width: 30.sp, color: DataColors.white,),
          ),
        ),
        SizedBox(
          height: 5.sp,
        ),
        Text(
          tahun,
          style: TextStyle(
              fontSize: 8.5.sp,
              fontWeight: FontWeight.bold,
              color: DataColors.primary700),
        )
      ],
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:gostradav2/app/ui/theme/color.dart';
// import 'package:sizer/sizer.dart';

// class WidgetInfoPages extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         ClipPath(
//           clipper: ClipPathClass(),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(left: 10),
//                 height: 60,
//                 width: 100,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.red[900],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           margin: const EdgeInsets.only(bottom: 0, left: 30),
//           child: Column(
//             // crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(bottom: 35, left: 37),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(40),
//                       color: Colors.amber[400],
//                     ),
//                     height: 45,
//                     width: 45,
//                     child: Icon(Icons.access_alarm),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text("data")
//                 ],
//               )
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

// class ClipPathClass extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height);
//     path.quadraticBezierTo(
//         size.width / 2, size.height + 20, size.width, size.height);
//     path.lineTo(size.width, 0);

//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }
