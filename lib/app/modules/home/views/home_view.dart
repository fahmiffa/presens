import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView(
        padding: EdgeInsets.all(30.0),
        children: [
          Container(
            margin: EdgeInsets.only(top: 100.0),
            child: Column(children: <Widget>[
              Icon(Icons.qr_code_2_rounded, color: Colors.blue, size: 120.0),
              SizedBox(
                width: 200.0,
                height: 10.0,
              ),
              Text(
                "Login Absensi",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ]),
          ),
          TextFormField(
            controller: controller.emailTxt,
            decoration: InputDecoration(
              labelText: "Email",
            ),
          ),
          TextFormField(
            controller: controller.passTxt,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          SizedBox(height: 20.0),
          MaterialButton(
            onPressed: () => controller.auth(),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.blue)),
            color: Colors.blue,
            textColor: Colors.white,
            child: Text("login"),
          ),
        ],
      ),
    ));
  }
}
