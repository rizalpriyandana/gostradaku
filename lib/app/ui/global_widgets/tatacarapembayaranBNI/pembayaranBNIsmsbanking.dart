// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:sizer/sizer.dart';

class PembayaranBNIsmsbanking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 0.sp),
          child: Text(
            "1.\t Buka Aplikasi SMS Banking BNI",
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
            '2.\tPilih menu "Transfer"',
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
            '3.\tPilih menu "Transfer rekening BNI"',
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
            '4. Masukkan nomor rekening tujuan dengan 16 digit \n\t\t\t\tNomor VA (Contoh: 8241002201150001)',
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
            '5.\tMasukkan nominal transfer sesuai dengan \n\t\t\t tagihan atau kewajiban Anda. Nominal yang \n\t\t\t berbeda tidak dapat diproses',
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
            '6.\tPilih "Proses" kemudian "Setuju"',
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
            '7.\tReply SMS dengan ketik pin sesuai perintah',
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
            '8. Transaksi Berhasil',
            style: TextStyle(fontSize: 10.sp, color: DataColors.primary600),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: 7.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.sp),
          child: Text(
            'Note : ',
            style: TextStyle(
                fontSize: 10.sp,
                color: DataColors.primary600,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: 2.sp,
        ),
        Text(
          "Altenatif lain anda dapat mengirim sms secara langsung dengan format sebagai berikut : ",
          style: TextStyle(color: DataColors.primary600, fontSize: 10.sp),
          textAlign: TextAlign.justify,
        ),
        Text(
          "TRF[SPASI]NomorVA[SPASI]Nominal",
          style: TextStyle(color: DataColors.primary600, fontSize: 10.sp, fontWeight: FontWeight.bold),
          textAlign: TextAlign.justify,
        ),
        Text(
          "Setelah itu kirim sms ke nomor 3346",
          style: TextStyle(color: DataColors.primary600, fontSize: 10.sp),
          textAlign: TextAlign.justify,
        ),
        Text(
          "Contoh : TRF 8241002201150001 44000",
          style: TextStyle(color: DataColors.primary600, fontSize: 10.sp, fontWeight: FontWeight.bold),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
