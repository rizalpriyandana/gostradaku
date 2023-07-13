// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:sizer/sizer.dart';

class PembayaranAgen46 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 0.sp),
          child: Text(
            "1.\t\tKunjungi Agen46 terdekat (warung/toko/kios \n\t\t\t\tdengan tulisan Agen46)",
            style: TextStyle(fontSize: 10.sp, color: DataColors.primary600),
            // textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: 2.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.sp),
          child: Text(
            '2.\tInformasikan kepada Agen46, bahwa anda ingin \n\t\t\t\tmelakukan pembayaran "Virtual Account Billing"',
            style: TextStyle(fontSize: 10.sp, color: DataColors.primary600),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: 2.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.sp),
          child: Text(
            "3.\tSerahkan nomor VA anda kepada Agen46",
            style: TextStyle(fontSize: 10.sp, color: DataColors.primary600),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: 2.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.sp),
          child: Text(
            '4.\tAgen melakukan konfirmasi kepada Anda',
            style: TextStyle(fontSize: 10.sp, color: DataColors.primary600),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: 2.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.sp),
          child: Text(
            '5.\tAgen46 Proses Transaksi',
            style: TextStyle(fontSize: 10.sp, color: DataColors.primary600),
            // textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: 2.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.sp),
          child: Text(
            '6. Apabila transaksi berhasil, anda akan menerima\n\t\t\t bukti pembayaran dari AGEN46 tersebut',
            style: TextStyle(fontSize: 10.sp, color: DataColors.primary600),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: 2.sp,
        ),
      ],
    );
  }
}
