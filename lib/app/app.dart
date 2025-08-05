import 'package:odrs/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:odrs/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:odrs/ui/views/home/home_view.dart';
import 'package:odrs/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:odrs/ui/bottom_sheets/select_photo/select_photo_sheet.dart';
import 'package:odrs/ui/views/login/login_view.dart';
import 'package:odrs/ui/views/signup/signup_view.dart';
import 'package:odrs/ui/views/select_account_type/select_account_type_view.dart';
import 'package:odrs/ui/views/court_form/court_form_view.dart';
import 'package:odrs/ui/views/navigation/navigation_view.dart';
import 'package:odrs/ui/views/cases_dashboard/cases_dashboard_view.dart';
import 'package:odrs/ui/views/initiating_party/initiating_party_view.dart';
import 'package:odrs/ui/views/icadrp_agreement/icadrp_agreement_view.dart';
import 'package:odrs/ui/views/case_details/case_details_view.dart';
import 'package:odrs/ui/views/mediator_details/mediator_details_view.dart';
import 'package:odrs/ui/views/settings/settings_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: SelectAccountTypeView),
    MaterialRoute(page: CourtFormView),
    MaterialRoute(page: NavigationView),
    MaterialRoute(page: CasesDashboardView),
    MaterialRoute(page: InitiatingPartyView),
    MaterialRoute(page: IcadrpAgreementView),
    MaterialRoute(page: CaseDetailsView),
    MaterialRoute(page: MediatorDetailsView),
    MaterialRoute(page: SettingsView),
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
