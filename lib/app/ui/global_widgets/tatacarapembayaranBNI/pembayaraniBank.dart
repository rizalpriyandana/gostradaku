// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:sizer/sizer.dart';

class PembayaraniBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 0.sp),
          child: Text(
            "1.\t\tBuka Browser",
            style: TextStyle(fontSize: 10.sp, color: DataColors.primary600),
            // textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: 2.sp,
        ),
        Padding(
            padding: EdgeInsets.only(left: 0.sp),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                  text: "2. Ketik alamat ",
                  style:
                      TextStyle(color: DataColors.primary600, fontSize: 11.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: "https://ibank.bni.co.id ",
                      style:
                          TextStyle(color: DataColors.primary800, fontSize: 11.sp, fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: 'kemudian \n\t\t\t tekan tombol "Enter"',
                      style: TextStyle(
                          color: DataColors.primary600, fontSize: 11.sp),
                    ),
                  ]),
            )),
        SizedBox(
          height: 2.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.sp),
          child: Text(
            "3.\tMasukkan User ID dan Password",
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
            '4.\tPilih Menu "Transfer"',
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
            '5.\tPilih "Virtual Account Billing"',
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
            "6.\tKemudian masukkan nomor VA anda \n\t\t\t (Contoh:  8241002201150001) ",
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
            "7. Selanjutnya pilih rekening debet yang akan \n\t\t\t digunakan",
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
            '8. Pilih "Lanjut"',
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
            '9. Kemudian tagihan yang harus dibayaran akan \n\t\t\t\tmuncul pada layar konfirmasi',
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
            "10.\tMasukkan Kode Otentikasi Token",
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
            "11.\t\tPembayaran Anda telah berhasil",
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
