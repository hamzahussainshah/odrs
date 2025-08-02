import 'package:odrs/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:odrs/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:odrs/ui/views/home/home_view.dart';
import 'package:odrs/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:odrs/ui/bottom_sheets/select_photo/select_photo_sheet.dart';
import 'package:odrs/ui/views/login/login_view.dart';
import 'package:odrs/ui/views/signup/signup_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: SelectPhotoSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
