import 'dart:convert';
import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/data/models/getipk.dart';
import 'package:gostradav1/app/data/models/login_m.dart';
import 'package:gostradav1/app/data/models/pengumuman_m.dart';
import 'package:gostradav1/app/data/models/profile.dart';
import 'package:gostradav1/app/ui/pages/kategori/penawaran_krs/penawaran_krs.dart';
import 'package:gostradav1/app/ui/pages/navigation/dashboard.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import '../../data/models/test_m.dart';
import '../../routes/rout_name.dart';
import '../../ui/pages/kategori/khs/khs.dart';
import '../../ui/pages/kategori/krs/krs.dart';
import '../../ui/pages/kategori/riwayat_bayar/riwayat_bayar.dart';
import '../../ui/pages/navigation/chat.dart';

class DashboardController extends GetxController {
  String hsmsg = "";
  String fakultas = ""; 
  String prodi = ""; 
  var isLoading = true.obs;
  final String urlPhoto = 'https://siakad.strada.ac.id/uploads/mhs/';
  final box = GetStorage();
  late Map data = box.read("dataUser") as Map<String, dynamic>;
  TooltipBehavior? tooltipBehavior;

  

  // final List<ChartData> chartData = <ChartData>[
  //           ChartData("2010", "10.53"),
  //           ChartData(2011, 9.5),
  //           ChartData(2012, 10),
  //           ChartData(2013, 9.4),
  //           ChartData(2014, 5.8),
  //           ChartData(2015, 4.9),
  //           ChartData(2016, 4.5),
  //           ChartData(2017, 3.6),
  //           ChartData(2018, 3.43),
  //       ];

  List<String> urlImage = [
    // 'assets/images/dashboard/slider/slide1.png',
    // 'assets/images/dashboard/slider/slide2.png',
    // 'assets/images/dashboard/slider/slide3.png',
    // 'assets/images/dashboard/slider/slide4.png',
  ];
  List<String> capsSlider = [
    // 'Her-registrasi dan pemrograman KRS online',
    // 'Pengajuan daftar wisuda tahun 2022',
    // 'Pengumuman Perkuliahan Tatap Muka Terbatas semester genap tahun 2021/2022',
    // 'Penghitungan nilai dan IP mandiri',
  ];

  @override
  void onInit() {
    
    tooltipBehavior = TooltipBehavior(enable: true);
    checkwisuda(data['nim']);
    // getprofile(data['nim']);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      var payload = json.decode(message.data["data"]);
      RemoteNotification? notification = message.notification;

      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: notification.hashCode,
              channelKey: 'basic_channel',
              title: payload["title"],
              body: payload["message"],
              wakeUpScreen: true,
              notificationLayout: NotificationLayout.Default,
              payload: {"type": payload["type"]}));
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      var payload = json.decode(message.data["data"]);
      var type = payload["type"];
      switch (type) {
        case "1":
          {
            Get.to(RoutName.root);
          }
          break;

        case "2":
          {
            Get.to((PenawaranKrsPage()));
          }
          break;

        case "3":
          {
            Get.to(KrsPage());
          }
          break;

        case "4":
          {
            Get.to(RoutName.root);
          }
          break;
        case "5":
          {
            Get.to(KhsPage());
          }
          break;
        case "6":
          {
            Get.to(ChatPage());
          }
          break;
        case "7":
          {
            Get.to(RiwayatBayarPage());
          }
          break;
        default:
          {
            Get.to(RoutName.root);
          }
          break;
      }
    });
    super.onInit();
  }
  
  

  getipk(String nim) async {
    final Map<String, dynamic> dataBody = {
      RBModel.nim: nim,
    };

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/dashboard/show_ipk"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      // print(DataUser['data']);

      //var test = jsonDecode(DataUser['data']);
      //print(test);

      // List list =
      //result2['data'].map((data) => DataModel.fromJson(data)).toList();
      // print(result2);
      if (databody['error'] == true) {
        //show error
        return null;
      } else {
        var result = GetIpkModel.fromJson(databody);

        // for (var item = 0; item < result.data!.length; item++) {

        //   //listipk.add([result.data![item].semester, result.data![item].ipk]);
        // }

        final List<ChartData> chartData = List.generate(
            result.data!.length,
            (index) => ChartData("Semester " + result.data![index].semester,
                result.data![index].ipk));

        return chartData;
      }
    }
  }

  checkwisuda(String nim) async {
    final Map<String, dynamic> dataBody = {
      CheckWisudaModel.nim: nim,
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/wisuda/check_graduation"),
        body: dataBody);
    if (response.statusCode == 200) {
      var dataku = jsonDecode(response.body);
      if (dataku['error'] == true) {
        return null;
      } else {
        hsmsg = dataku['msg'];
        isLoading.value = false;
      }
    }
  }
  getprofile(String nim) async {
    final Map<String, dynamic> dataBody = {
      LoginModel.username: nim
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/profile/get_profile"),
        body: dataBody);
    if (response.statusCode == 200) {
      var user = jsonDecode(response.body);
      if (user['error'] == true) {
        //
      } else {
        // load berhasil
        
        // urlphoto = user['data']['photo'];
        // var data = ProfileModel.fromJson(user);
        fakultas = user['data']['fakultas'];
        prodi = user['data']['prodi'];
        isLoading.value = false;
        
        // Get.snackbar("Url", urlphoto);
      }
      
      // isLoading.value = false;
    }
  }

  getpengumuman() async {
    var response = await http.get(
      Uri.parse(
          "https://siakad.strada.ac.id/mobile/pengumuman/get_pengumuman"),
    );

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      // print(DataUser['data']);

      //var test = jsonDecode(DataUser['data']);
      //print(test);

      // List list =
      //result2['data'].map((data) => DataModel.fromJson(data)).toList();
      // print(result2);
      if (databody['error'] == true) {
        //show error
        return null;
      } else {
        capsSlider.clear();
        urlImage.clear();

        var result = PengumumanModel.fromJson(databody);
        for (var i = 0; i < result.total; i++) {
          var rng = Random();
          if (i > 3) {}
          capsSlider.add(result.data![i].title);

          int j = rng.nextInt(4) + 1;
          urlImage.add("assets/images/dashboard/slider/slide$j.png");
        }

        return result;
      }
    }
  }

  getdetailpengumuman(String id_pengumuman) async {
    final Map<String, dynamic> dataBody = {
      detailPengumuman.id_pengumuman: id_pengumuman,
    };
    var response = await http.post(
        Uri.parse(
            "https://siakad.strada.ac.id/mobile/pengumuman/detail_pengumuman"),
        body: dataBody);
    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);

      // print(DataUser['data']);

      //var test = jsonDecode(DataUser['data']);
      //print(test);

      // List list =
      //result2['data'].map((data) => DataModel.fromJson(data)).toList();
      // print(result2);
      if (databody['error'] == true) {
        //show error
        return null;
      } else {
        var result = PengumumanDetailModel.fromJson(databody);
        return result;
      }
    } else {}
  }
}
