import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_s_login/dashboard.dart';
import 'package:getx_s_login/login.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.blue),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.purpleAccent,
    ),
    themeMode: ThemeMode.system,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final userdata = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    userdata.writeIfNull("isLogged", false);
    Future.delayed(Duration.zero, () async {
      checkIfLoggedin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("dummy")),
      body: Container(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void checkIfLoggedin() {
    userdata.read("isLogged")
        ? Get.offAll(DashBoard())
        : Get.offAll(LoginPage());
  }
}
