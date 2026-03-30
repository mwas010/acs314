import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/logincontroller.dart';
import 'package:flutter_application_1/controllers/signupcontoller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:http/http.dart' as http;

Signupcontoller signupcontroller = Get.put(Signupcontoller());
TextEditingController passwordController = TextEditingController();
TextEditingController passwordController1 = TextEditingController();
TextEditingController phonenumberController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController firstnameController = TextEditingController();
TextEditingController secondnameController = TextEditingController();

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Added SingleChildScrollView to prevent keyboard overflow
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            // Removed CrossAxisAlignment.start to allow centering
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),

              // Title: Centered using SizedBox width
              SizedBox(
                width: double.infinity,
                child: Text(
                  "Create Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(height: 10),

              // Subtitle: Centered
              SizedBox(
                width: double.infinity,
                child: Text(
                  "Please fill in the details to create an account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              SizedBox(height: 30),

              // First Name
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter your first name",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: firstnameController,
                decoration: InputDecoration(
                  hintText: "John", // Changed from labelText to hintText
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              SizedBox(height: 20),

              // Last Name
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter your second name",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: secondnameController,
                decoration: InputDecoration(
                  hintText: "Doe",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter your phone number",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: phonenumberController,
                decoration: InputDecoration(
                  hintText: "07........",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              SizedBox(height: 20),

              // Email
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter your email address",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "johndoe@gmail.com",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.email),
                ),
              ),

              SizedBox(height: 20),

              // Password
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter your password",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 8),

              Obx(
                () => TextField(
                  obscureText: !signupcontroller.isPasswordVisible.value,
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "........",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      child: Icon(
                        signupcontroller.isPasswordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onTap: () {
                        signupcontroller.togglePassword();
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Confirm your password",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Obx(
                () => TextField(
                  obscureText: !signupcontroller.isConfirmPasswordVisible.value,
                  controller: passwordController1,

                  decoration: InputDecoration(
                    hintText: "........",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      child: Icon(
                        signupcontroller.isConfirmPasswordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onTap: () {
                        signupcontroller.toggleConfirmPassword();
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Submit Button
              ElevatedButton(
                onPressed: () async {
                  if (firstnameController.text.isEmpty) {
                    Get.snackbar(
                      "Error",
                      "First name is required",
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                    );
                    return;
                  } else if (secondnameController.text.isEmpty) {
                    Get.snackbar(
                      "Error",
                      "Second name is required",
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                    );
                    return;
                  } else if (phonenumberController.text.isEmpty) {
                    Get.snackbar(
                      "Error",
                      "Phone number is required",
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                    );
                    return;
                  } else if (emailController.text.isEmpty) {
                    Get.snackbar(
                      "Error",
                      "Email is required",
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                    );
                    return;
                  } else if (passwordController.text.isEmpty) {
                    Get.snackbar(
                      "Error",
                      "Password is required",
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                    );
                    return;
                  } else if (passwordController1.text.isEmpty) {
                    Get.snackbar(
                      "Error",
                      "Confirm password is required",
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                    );
                    return;
                  } else if (passwordController.text !=
                      passwordController1.text) {
                    Get.snackbar(
                      "Error",
                      "Passwords do not match",
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                    );
                    return;
                  } else {
                    final response = await http.get(
                      Uri.parse(
                        "http://localhost/acs314/add_users.php?firstname=${firstnameController.text}&secondname=${secondnameController.text}&phonenumber=${phonenumberController.text}&email=${emailController.text}&password=${passwordController.text}",
                      ),
                    );
                    if (response.statusCode == 200) {
                      final serverData = jsonDecode(response.body);
                      if (serverData["message"] == "User added successfully") {
                        Get.snackbar(
                          "Success",
                          "Account created successfully",
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );
                        Navigator.pushNamed(context, "/");
                      }
                    } else {
                      Get.snackbar(
                        "Error",
                        "Failed to create account",
                        backgroundColor: Colors.redAccent,
                        colorText: Colors.white,
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Sign Up", style: TextStyle(fontSize: 18)),
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/");
                    },
                    child: Text(
                      " Log In",
                      style: TextStyle(color: Colors.deepOrangeAccent),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
