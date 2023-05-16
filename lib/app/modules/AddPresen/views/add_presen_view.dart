import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_presen_controller.dart';
import 'package:date_time_picker/date_time_picker.dart';

class AddPresenView extends GetView<AddPresenController> {
  // const AddPresenView({Key? key}) : super(key: key);
  AddPresenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Form Pengaajuan Cuti'),
          centerTitle: true,
        ),
        body: Center(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              DateTimePicker(
                controller: controller.dateTxt,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                dateLabelText: 'Tanggal',
                // onChanged: (val) => print(val),
                validator: (val) {
                  return null;
                },
              ),
              TextFormField(
                controller: controller.catatanTxt,
                decoration: InputDecoration(
                  labelText: "Catatan",
                ),
              ),
              Container(
                  margin: EdgeInsets.all(20.0),
                  child: Obx(
                    () => DropdownButtonFormField(
                        value: controller.selectedItems,
                        isExpanded: true,
                        hint: Text("Jenis Cuti"),
                        items: controller.dropdownVal.map((item) {
                          return DropdownMenuItem(
                            child: Text(item.name),
                            value: item,
                          );
                        }).toList(),
                        onChanged: (val) {
                          controller.setSelected(val!);
                        }),
                  )),
              MaterialButton(
                onPressed: () => controller.store(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue)),
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Submit"),
              ),
            ],
          ),
        ));
  }
}
