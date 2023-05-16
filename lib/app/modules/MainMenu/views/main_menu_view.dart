import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../../../routes/app_pages.dart';
import '../controllers/main_menu_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MainMenuView extends GetView<MainMenuController> {
  const MainMenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Absensi'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100.0),
              child: Column(
                children: [
                  Text(
                    SpUtil.getString('name').toString(),
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: QrImage(
                      data: SpUtil.getString('qr').toString(),
                      size: 250,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_off_outlined), label: "Cuti"),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_2), label: "Absensi"),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Logout"),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Get.toNamed(Routes.MAIN_MENU);
              break;
            case 1:
              Get.toNamed(Routes.PRESEN);
              break;
            case 2:
              Get.toNamed(Routes.SCAN);
              break;
            case 3:
              Get.offAllNamed(Routes.HOME);
              SpUtil.clear();
              break;
          }
        },
      ),
    );
  }
}
