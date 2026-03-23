import 'package:get/state_manager.dart';

class Signupcontoller extends GetxController {
  var password;
  var isPasswordVisible = false.obs;

  signup(pass) {
    password = pass;
  }

  togglePassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
