import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:get_storage/get_storage.dart";
import 'package:getx_s_login/dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userdata = GetStorage();
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Login Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Alternate of shared prefrence"),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                      labelText: "Name",
                      fillColor: Colors.greenAccent,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                  controller: pass,
                  decoration: InputDecoration(
                      labelText: "Password",
                      fillColor: Colors.greenAccent,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ),
            ElevatedButton(
                onPressed: () {
                  final uname = name.text;
                  final upass = pass.text;
                  if (name.text != "" && pass.text != "") {
                    debugPrint("Login Success");
                    userdata.write("isLogged", true);
                    userdata.write("name", uname);

                    Get.offAll(DashBoard());
                  } else {
                    Get.snackbar("username",
                        "Please enter username and password Correclty",
                        snackPosition: SnackPosition.BOTTOM);
                  }
                },
                child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
