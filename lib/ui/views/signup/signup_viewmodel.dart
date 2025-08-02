import 'package:flutter/cupertino.dart';
import 'package:odrs/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class SignupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController phoneCountryController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool obscurePassword = false;
  bool obscureRetypePassword = false;
  bool termsAgreement = false;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void toggleRetypePasswordVisibility() {
    obscureRetypePassword = !obscureRetypePassword;
    notifyListeners();
  }

  void toggleTermsAgreement(bool? value) {
    if (value != null) {
      termsAgreement = value;
      notifyListeners();
    }
  }

  void navigateToPricacyPolicyView() {}

  void navigateToLoginView() {
    _navigationService.navigateToLoginView();
  }
}
