import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/scan_controller.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';

class ScanView extends GetView<ScanController> {
  ScanView({Key? key}) : super(key: key);
  String text = '';

  final ScanController scanController = Get.put(ScanController());

  @override
  Widget build(BuildContext context) {
    // print(controller.scanQRCode());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Absensi Scan QR CODE'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.all(50.0),
                  child: Obx(
                    () => DropdownButtonFormField(
                      isExpanded: true,
                      hint: Text("Pilih Absen"),
                      value: controller.selectedOption,
                      items: controller.optionsList.map((option) {
                        return DropdownMenuItem(
                          child: Text(option.name),
                          value: option,
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        controller.setSelectedOption(newValue!);
                      },
                    ),
                  )),
              TextButton.icon(
                onPressed: () async {
                  await scanController.scanQRCode();
                  if (controller.selectedOption == null) {
                    Get.snackbar('error', 'Silahkan Pilih Absensi',
                        backgroundColor: Colors.red, colorText: Colors.white);
                  } else {
                    text = (await scanner.scan())!;
                    controller.store(text);
                  }
                },
                icon: const Icon(Icons.camera_enhance),
                label: Text(
                  'SCAN',
                ),
              )
            ],
          ),
        ));
  }
}
