import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/logincontroller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

Logincontroller logincontroller = Get.put(Logincontroller());
TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.deepOrangeAccent,
      //   title: Text("Logging Page", style: TextStyle(color: Colors.white)),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Text(
            //   "Jumia Marketplace",
            //   style: TextStyle(
            //     color: Colors.blue,
            //     fontSize: 30,
            //     fontWeight: FontWeight.w800,
            //   ),
            // ),
            SizedBox(height: 40),
            Image.asset(
              "assets/images.jpg",
              width: 200,
              alignment: Alignment.topCenter,
            ),
            SizedBox(height: 40.0),

            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 20, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Enter Username",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "Email or Phone Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 20, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Enter Password",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Obx(
                () => TextField(
                  obscureText: !logincontroller.isPasswordVisible.value,
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "PIN or Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      child: Icon(
                        logincontroller.isPasswordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),

                      onTap: () {
                        logincontroller.togglePassword();
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // MaterialButton(
            //   onPressed: () {},
            //   child: Text("Login", style: TextStyle(color: Colors.white)),
            //   color: Colors.deepOrangeAccent,

            // ),
            GestureDetector(
              onTap: () {
                bool success = logincontroller.login(
                  usernameController.text,
                  passwordController.text,
                );
                if (success) {
                  Get.offAndToNamed('/homescreen');
                } else {
                  Get.snackbar(
                    'Login failed',
                    'invalid username or password',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },

              // Handle login logic here
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/signup");
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ),
                SizedBox(width: 40),
                Text(
                  "forgot password? ",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
                Text(
                  "reset password",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
