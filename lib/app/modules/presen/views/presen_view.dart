import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presen/app/routes/app_pages.dart';
import '../controllers/presen_controller.dart';

class PresenView extends GetView<PresenController> {
  const PresenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Data Cuti'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton.small(
          onPressed: () => Get.toNamed(Routes.ADD_PRESEN),
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
          tooltip: 'Tambah Penganjuan Cuti',
        ),
        body: Obx(() => SingleChildScrollView(
              child: ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.listData.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = controller.listData[index];
                  return ListTile(
                    title: Text(
                      item['tanggal'],
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(item['note']),
                    trailing: Text(item['status'].toString()),
                  );
                },
              ),
            )));
  }
}
