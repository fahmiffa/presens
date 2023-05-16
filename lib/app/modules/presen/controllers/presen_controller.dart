import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presen/app/data/login_provider.dart';
import 'package:intl/intl.dart';
import 'package:sp_util/sp_util.dart';
import '../../../routes/app_pages.dart';

class PresenController extends GetxController {
  var listData = [].obs;

  @override
  void onInit() {
    dataCuti();
    super.onInit();
  }

  void dataCuti() {
    listData.clear();
    LoginProvider().cuti().then((value) {
      var resp = value.body;
      if (value.statusCode == 200) {
        for (var element in resp) {
          DateTime dt1 = DateTime.parse(element['date']);
          var da = {
            'tanggal': DateFormat.yMd().format(dt1),
            'note': element['note'] ?? '',
            'status': (element['status'] == 1) ? 'Pending' : 'Success'
          };
          listData.add(da);
        }
      } else {
        Get.snackbar('error', resp['message'],
            backgroundColor: Colors.red, colorText: Colors.white);
        SpUtil.clear();
        Get.offAllNamed(Routes.HOME);
      }
    });
  }
}
