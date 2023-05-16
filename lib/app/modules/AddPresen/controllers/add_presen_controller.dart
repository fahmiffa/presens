import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import '../../../data/login_provider.dart';
import '../../../routes/app_pages.dart';

class MyObject {
  String id;
  String name;

  MyObject({required this.id, required this.name});
}

class AddPresenController extends GetxController {
  TextEditingController catatanTxt = TextEditingController();
  TextEditingController dateTxt = TextEditingController();

  var dropdownVal = <MyObject>[].obs;
  MyObject? selectedItems;

  void setSelected(value) {
    selectedItems = value;
  }

  @override
  void onInit() {
    ListCuti();
    super.onInit();
  }

  void store() {
    var val = {
      'date': dateTxt.text,
      'cuti': selectedItems!.id,
      'note': catatanTxt.text
    };

    LoginProvider().storeCuti(val).then((value) {
      var resp = value.body;
      if (value.statusCode == 200) {
        Get.snackbar('succes', resp['message'],
            backgroundColor: Colors.green, colorText: Colors.white);
        update();
        Get.toNamed(Routes.MAIN_MENU);
      } else {
        Get.snackbar('error', resp['message'],
            backgroundColor: Colors.red, colorText: Colors.white);
        SpUtil.clear();
        Get.offAllNamed(Routes.HOME);
      }
    });
  }

  void ListCuti() {
    dropdownVal.clear();
    LoginProvider().ListCuti().then((value) {
      var resp = value.body;
      print(resp);
      if (value.statusCode == 200) {
        for (var element in resp) {
          dropdownVal.add(
              MyObject(id: element['id'].toString(), name: element['name']));
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
