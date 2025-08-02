import 'package:flutter/cupertino.dart';
import 'package:odrs/app/app.locator.dart';
import 'package:odrs/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obscureText = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool rememberMe = false;

  void togglePasswordVisibility() {
    obscureText = !obscureText;
    notifyListeners();
  }


  void navigateToForgotPasswordView() {
  }

  void toggleRememberMe(bool? value) {
    if (value != null) {
      rememberMe = value;
      notifyListeners();
    }
  }

  void navigateToSignUpView() {
    _navigationService.navigateToSignupView();
  }
}
