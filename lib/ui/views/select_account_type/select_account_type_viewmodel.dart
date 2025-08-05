import 'package:odrs/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class SelectAccountTypeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  void navigateToRegistrationView() {
    _navigationService.navigateToSignupView();
  }
}
