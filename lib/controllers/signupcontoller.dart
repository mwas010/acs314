import 'package:get/state_manager.dart';

class Signupcontoller extends GetxController {
  var password;
  var confirmPassword;
  var email;
  var phonenumber;
  var firstname;
  var secondname;
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  signup(pass) {
    password = pass;
  }

  togglePassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  toggleConfirmPassword() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }
}
