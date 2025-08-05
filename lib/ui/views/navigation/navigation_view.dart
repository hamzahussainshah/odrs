import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/common/custom_drawer/custom_drawer.dart';
import 'navigation_viewmodel.dart';

class NavigationView extends StackedView<NavigationViewModel> {
  const NavigationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NavigationViewModel viewModel,
    Widget? child,
  ) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.surface,
        statusBarIconBrightness:
            Theme.of(context).brightness == Brightness.light
                ? Brightness.dark
                : Brightness.light,
      ),
      child: Scaffold(
        key: viewModel.scaffoldKey,
        backgroundColor: Theme.of(context).colorScheme.background,
        drawer: CustomDrawer(
          onCloseTap: () => viewModel.scaffoldKey.currentState?.openEndDrawer(),
          onTapCaseDashboard: () {
            viewModel.setIndex(0);
            viewModel.onDrawerItemTap(0);
          },
          onTapCourtForm: () {
            viewModel.setIndex(1);
            viewModel.onDrawerItemTap(1);
          },
          onTapInitiatingParty: () {
            viewModel.setIndex(2);
            viewModel.onDrawerItemTap(2);
          },
          onTapICADRPFeedback: () {
            viewModel.setIndex(3);
            viewModel.onDrawerItemTap(3);
          },
          onLogOut: () {
            viewModel.logout();
          },
          selectedDrawerIndex: viewModel.selectedDrawerIndex,
          onTapSettings: () {
            viewModel.navigateToSettingsView();
            viewModel.onDrawerItemTap(4);
          },
          onTapCaseDetails: () => viewModel.navigateToCaseDetailsView(),
          onTapMediatorDetails: () => viewModel.navigateToMediatorDetailsView(),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            viewModel.isDrawerOpen
                ? viewModel.drawerLabels[viewModel.drawerIndex]
                : viewModel.bottomNavLabels[viewModel.currentIndex],
            style: Theme.of(context).textTheme.titleMedium,
          ),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              viewModel.scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // Main Content
              Expanded(
                child: viewModel.isDrawerOpen
                    ? IndexedStack(
                        index: viewModel.drawerIndex,
                        children: viewModel.drawerScreens,
                      )
                    : IndexedStack(
                        index: viewModel.currentIndex,
                        children: viewModel.bottomNavScreens,
                      ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: viewModel.currentIndex,
          type: BottomNavigationBarType.fixed,
          items: viewModel.getBottomNavBarItems(viewModel.currentIndex),
          onTap: (index) {
            viewModel.setIndex(index);
            viewModel.isDrawerOpen = false;
            viewModel.notifyListeners();
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.outline,
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }

  @override
  NavigationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NavigationViewModel();
}
