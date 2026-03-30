import 'package:get/state_manager.dart';

class Logincontroller extends GetxController {
  var username;
  var password;
  var isPasswordVisible = false.obs;

  togglePassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
