import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/views/login.dart';
import 'package:flutter_application_1/views/signup.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/views/homescreen.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => LoginScreen()),
        GetPage(name: "/signup", page: () => SignupScreen()),
        GetPage(name: "/homescreen", page: () => HomeScreen()),
      ],
      debugShowCheckedModeBanner: false,
       home: LoginScreen()
       ),
  );
}
