import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/views/login.dart';
import 'package:flutter_application_1/views/signup.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/views/homescreen.dart';
import 'package:flutter_application_1/views/cart.dart';
import 'package:flutter_application_1/views/profile.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => LoginScreen()),
        GetPage(name: "/signup", page: () => SignupScreen()),
        GetPage(name: "/homescreen", page: () => HomeScreen()),
        GetPage(name: "/profile", page: () => Profile()),
        GetPage(name: '/cart', page: () => Cart()),
      ],
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    ),
  );
}
