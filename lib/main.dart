import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odrs/app/app.bottomsheets.dart';
import 'package:odrs/app/app.dialogs.dart';
import 'package:odrs/app/app.locator.dart';
import 'package:odrs/app/app.router.dart';
import 'package:odrs/ui/theme/app_theme.dart';
import 'package:odrs/ui/views/settings/settings_viewmodel.dart'; // Add this import
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  // Initialize theme service
  await ThemeService.instance.initialize();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return ValueListenableBuilder<ThemeMode>(
            valueListenable: ThemeService.instance.themeModeNotifier,
            builder: (context, themeMode, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: appTheme(context),
                darkTheme: appDarkTheme(context),
                themeMode: themeMode,
                initialRoute: Routes.startupView,
                onGenerateRoute: StackedRouter().onGenerateRoute,
                navigatorKey: StackedService.navigatorKey,
                navigatorObservers: [StackedService.routeObserver],
              );
            },
          );
        },
      ),
    );
  }
}