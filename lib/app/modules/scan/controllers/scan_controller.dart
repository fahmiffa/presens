import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presen/app/data/login_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../routes/app_pages.dart';

class Option {
  final String id;
  final String name;

  Option({required this.id, required this.name});
}

class ScanController extends GetxController {
  var status = Permission.camera.status;

  Option? selectedOption;
  var optionsList = <Option>[
    Option(id: 'in', name: 'Masuk'),
    Option(id: 'out', name: 'Keluar'),
  ].obs;

  void setSelectedOption(Option option) {
    selectedOption = option;
  }

  void store(value) {
    var da = {'id': value, 'status': selectedOption!.id};
    LoginProvider().storePresen(da).then((value) {
      var resp = value.body;
      if (value.statusCode == 200) {
        Get.snackbar('succes', resp['message'],
            backgroundColor: Colors.green, colorText: Colors.white);
        Get.toNamed(Routes.SCAN);
      } else {
        Get.snackbar('error', resp['message'],
            backgroundColor: Colors.red, colorText: Colors.white);
        // SpUtil.clear();
        // Get.offAllNamed(Routes.HOME);
      }
    });
  }

  Future<void> requestPermission() async {
    final permissionStatus = await Permission.camera.request();
    if (permissionStatus.isGranted) {
      // Izin akses diberikan
    } else if (permissionStatus.isDenied) {
      // Izin akses ditolak
    } else if (permissionStatus.isPermanentlyDenied) {
      // Pengguna menolak izin akses secara permanen, buka pengaturan aplikasi untuk mengaktifkan izin akses
    }
  }

  Future<void> scanQRCode() async {
    final status = await Permission.camera.status;
    if (status.isDenied) {
      await requestPermission();
      return;
    }
  }
}
