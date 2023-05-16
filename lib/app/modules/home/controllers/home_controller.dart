import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:presen/app/data/login_provider.dart';
import 'package:presen/app/routes/app_pages.dart';
import 'package:sp_util/sp_util.dart';

class HomeController extends GetxController {
  TextEditingController emailTxt = TextEditingController();
  TextEditingController passTxt = TextEditingController();

  void auth() {
    String email = emailTxt.text;
    String pass = passTxt.text;

    if (email.isEmpty || pass.isEmpty) {
      Get.snackbar('error', 'invalid Data',
          backgroundColor: Colors.red, colorText: Colors.white);
    } else {
      EasyLoading.show(status: 'loading...');
      var data = {'email': email, 'password': pass};
      LoginProvider().auth(data).then((value) {
        if (value.statusCode == 200) {
          SpUtil.putString('token', value.body['token']);
          SpUtil.putString('name', value.body['empolyee']);
          SpUtil.putString('email', value.body['email']);
          SpUtil.putBool('isLogin', true);
          Get.offAllNamed(Routes.MAIN_MENU);
        } else {
          Get.snackbar('error', 'Login Gagal',
              backgroundColor: Colors.red, colorText: Colors.white);
        }
      });
      EasyLoading.dismiss();
    }
  }
}
