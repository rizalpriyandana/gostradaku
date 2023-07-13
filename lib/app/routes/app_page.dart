import 'package:get/get.dart';
import 'package:gostradav1/app/bindings/krsbindings.dart';

import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:gostradav1/app/ui/pages/kategori/akademik/akademik.dart';
import 'package:gostradav1/app/ui/pages/kategori/khs/detailKhs.dart';
import 'package:gostradav1/app/ui/pages/kategori/khs/khs.dart';
import 'package:gostradav1/app/ui/pages/kategori/krs/detailKrs.dart';
import 'package:gostradav1/app/ui/pages/kategori/krs/krs.dart';
import 'package:gostradav1/app/ui/pages/kategori/lainnya/lainnya.dart';
import 'package:gostradav1/app/ui/pages/kategori/nonakademik/softskill/editsoftskill.dart';
import 'package:gostradav1/app/ui/pages/kategori/penawaran_krs/penawaran_krs.dart';
import 'package:gostradav1/app/ui/pages/kategori/riwayat_bayar/detailtransaksi/detail_transaksi.dart';
import 'package:gostradav1/app/ui/pages/kategori/riwayat_bayar/riwayat_bayar.dart';

import 'package:gostradav1/app/ui/pages/kategori/tagihan/tagihan.dart';
import 'package:gostradav1/app/ui/pages/kategori/transkrip/transkrip.dart';
import 'package:gostradav1/app/ui/pages/kategori/upload_bukti_bayar/detail/detailpembayaran.dart';
import 'package:gostradav1/app/ui/pages/kategori/upload_bukti_bayar/upload_bukti_bayar.dart';
import 'package:gostradav1/app/ui/pages/login/login.dart';
import 'package:gostradav1/app/ui/pages/navigation/bottom_navigation.dart';
import 'package:gostradav1/app/ui/pages/navigation/dashboard.dart';
import 'package:gostradav1/app/ui/pages/notifikasi/notifikasi.dart';
import 'package:gostradav1/app/ui/pages/onboard/onboard.dart';
import 'package:gostradav1/app/ui/pages/splash/splash.dart';

import '../ui/pages/kategori/keuangan/kategori.dart';
import '../ui/pages/kategori/nonakademik/nonakademik.dart';
import '../ui/pages/kategori/nonakademik/softskill/inputsoftskill.dart';
import '../ui/pages/kategori/nonakademik/softskill/softskill.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: RoutName.splash,
      page: () => SplashPage(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: RoutName.onboard,
      page: () => OnBaoard(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: RoutName.login,
      page: () => LoginPage(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: RoutName.root,
      page: () => BottomNavigationPage(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: RoutName.home,
      page: () => DashboardPage(),
      // binding: DashboardBinding(),
    ),
    GetPage(
      name: RoutName.notifikasi,
      page: () => NotifikasiPage(),
      // binding: DashboardBinding(),
    ),

    // Kategori
    GetPage(name: RoutName.krs, page: () => KrsPage(), binding: KRSBinding()),
    GetPage(
      name: RoutName.detailkrs,
      page: () => DetailKRSPage(),
    ),
    // --------------------
    GetPage(
      name: RoutName.khs,
      page: () => KhsPage(),
    ),
    GetPage(
      name: RoutName.detailkhs,
      page: () => DetailKhsPage(),
    ),
    // --------------------
    GetPage(
      name: RoutName.transkrip,
      page: () => TranskripPage(),
    ),
    // --------------------
    GetPage(
      name: RoutName.penawaranKrs,
      page: () => PenawaranKrsPage(),
    ),
    // --------------------
    GetPage(
      name: RoutName.tagihan,
      page: () => TagihanPage(),
    ),
    GetPage(
      name: RoutName.buattagihan,
      page: () => SoftSkillPage(),
    ),
    // --------------------
    GetPage(
      name: RoutName.riwayatBayar,
      page: () => RiwayatBayarPage(),
    ),
    // --------------------
    GetPage(
      name: RoutName.uploadBuktiBayar,
      page: () => UploadBuktiBayarPage(),
    ),
    // --------------------
    GetPage(
      name: RoutName.lainnya,
      page: () => LainnyaPage(),
    ),
    GetPage(
      name: RoutName.kategori,
      page: () => KategoriPage(),
    ),
    GetPage(
      name: RoutName.detailtransaksi,
      page: () => DetailTransaksi(),
    ),
    GetPage(
      name: RoutName.kategoriakademik,
      page: () => AkademikPage(),
    ),
    GetPage(
      name: RoutName.kategorinonakademik,
      page: () => NonAkademikPage(),
    ),
    GetPage(
      name: RoutName.detailpembayaran,
      page: () => DetailPembayaran(),
    ),
    // --------------------
    // End Kategori
    GetPage(
      name: RoutName.softskill,
      page: () => SoftSkillPage(),
    ),
    GetPage(
      name: RoutName.inputsoftskill,
      page: () => InputSoftSkillPage(),
    ),
    GetPage(
      name: RoutName.editsoftskill,
      page: () => EditSoftSkillPage(),
    )
  ];
}
