import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_s_login/login.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final userdata = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("user dashboard"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          const Text("User Data",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Text("Name: ${userdata.read("name")}",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
          ElevatedButton(
              onPressed: () {
                userdata.write("isLogged", false);
                userdata.remove("name");
                Get.offAll(LoginPage());
              },
              child: const Text("Logout")),
        ],
      )),
    );
  }
}
