import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odrs/app/app.router.dart';
import 'package:odrs/ui/views/cases_dashboard/cases_dashboard_view.dart';
import 'package:odrs/ui/views/icadrp_agreement/icadrp_agreement_view.dart';
import 'package:odrs/ui/views/initiating_party/initiating_party_view.dart';
import 'package:odrs/ui/views/mediator_details/mediator_details_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../common/text_styles.dart';
import '../court_form/court_form_view.dart';

class NavigationViewModel extends IndexTrackingViewModel {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  // final LocalStorageService _storageService = locator<LocalStorageService>();
  bool isDrawerOpen = false;
  int drawerIndex = 0;
  int selectedDrawerIndex = 0;
  int cartItemsCount = 0;

  // Persistent list of drawer screens
  final List<Widget> drawerScreens = [
    const CasesDashboardView(),
    const CourtFormView(),
    const InitiatingPartyView(),
    const IcadrpAgreementView(),
    const CasesDashboardView(),
    const MediatorDetailsView(),
  ];

  // Persistent list of bottom navigation screens
  final List<Widget> bottomNavScreens = [
    const CasesDashboardView(),
    const CourtFormView(),
    const InitiatingPartyView(),
    const IcadrpAgreementView(),
  ];

  List<String> drawerLabels = const [
    "Cases Dashboard",
    "Court Form",
    "Initiating Party",
    "ICADRP Feedback",
    "Case Details",
    "Mediator Details",
  ];

  void onDrawerItemTap(int index) {
    drawerIndex = index; // Update the drawer index
    selectedDrawerIndex = index; // Update the selected drawer index
    isDrawerOpen = true; // Set drawer open state to true
    scaffoldKey.currentState?.closeDrawer(); // Close the drawer after selection
    notifyListeners(); // Notify listeners to rebuild the UI
  }

  List<BottomNavigationBarItem> getBottomNavBarItems(int selectedINDEX) {
    // Define unfilled and filled SVG paths for each icon
    List<IconData> navigationIcons = [
      Icons.dashboard,
      Icons.balance,
      Icons.person_add_alt_1,
      Icons.feedback,
    ];

    return List.generate(
      bottomNavLabels.length,
      (index) => BottomNavigationBarItem(
        icon: Builder(
          builder: (context) => Container(
            decoration: BoxDecoration(
              color: index == selectedINDEX
                  ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding:
                EdgeInsets.only(left: 8.w, right: 8.w, top: 6.h, bottom: 6.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon (filled if selected, unfilled if not)
                Icon(
                  navigationIcons[index],
                  color: index == selectedINDEX
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                4.horizontalSpace,
                // Label in front of the icon
                Text(
                  bottomNavLabels[index],
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: index == selectedINDEX
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 12.sp,
                        fontWeight: index == selectedINDEX
                            ? FontWeight.w500
                            : FontWeight.normal,
                      ),
                ),
              ],
            ),
          ),
        ),
        label: '',
      ),
    );
  }

  List<String> bottomNavLabels = const [
    "Cases Dashboard",
    "Court Form",
    "Initiating Party",
    "ICADRP Feedback",
  ];

  void changeLocation() {
    // Example: Navigate to a location picker screen
    _navigationService.navigateTo('location_picker_route');
  }

  // Method to open the drawer
  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
    notifyListeners();
  }

  void logout() {
    // _storageService.resetStorage();
    // _navigationService.replaceWith(Routes.loginView);
  }

  navigateToCartView() {
    // Add your navigation logic here
  }

  navigateToCaseDetailsView() {
    _navigationService.navigateToCaseDetailsView();
  }

  navigateToMediatorDetailsView() {
    _navigationService.navigateToMediatorDetailsView();
  }

  void navigateToSettingsView() {
    _navigationService.navigateToSettingsView();
  }
}
