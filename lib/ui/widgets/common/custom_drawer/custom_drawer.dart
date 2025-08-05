import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../common/app_colors.dart';
import '../../button.dart';
import 'custom_drawer_model.dart';

class CustomDrawer extends StackedView<CustomDrawerModel> {
  const CustomDrawer({
    super.key,
    required this.onTapCaseDashboard,
    required this.onCloseTap,
    required this.onTapCourtForm,
    required this.onTapInitiatingParty,
    required this.onTapICADRPFeedback,
    required this.onLogOut,
    required this.selectedDrawerIndex,
    required this.onTapCaseDetails,
    required this.onTapMediatorDetails,
    required this.onTapSettings,
  });

  final void Function() onCloseTap;
  final void Function() onTapCaseDashboard;
  final void Function() onTapCourtForm;
  final void Function() onTapInitiatingParty;
  final void Function() onTapICADRPFeedback;
  final void Function() onTapCaseDetails;
  final void Function() onTapMediatorDetails;
  final void Function() onLogOut;
  final void Function() onTapSettings;
  final int selectedDrawerIndex;

  @override
  Widget builder(
    BuildContext context,
    CustomDrawerModel viewModel,
    Widget? child,
  ) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.r)),
      backgroundColor: AppColors.white,
      elevation: 0,
      width: 0.8.sw,
      child: Padding(
        padding: EdgeInsets.only(left: 24.w, top: 62.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: onCloseTap,
                  child: Container(
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      color: AppColors.gray50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      size: 24.sp,
                      color: Theme.of(context).colorScheme.primary,
                      weight: 30,
                    ),
                  ),
                ),
                30.horizontalSpace,
              ],
            ),
            43.verticalSpace,
            buildDrawerIconContainer(
              label: "Cases Dashboard",
              icon: Icons.dashboard,
              context: context,
              onTap: onTapCaseDashboard,
              isSelected: selectedDrawerIndex == 0, // Check if selected
            ),
            10.verticalSpace,
            buildDrawerIconContainer(
              label: "Court Form",
              icon: Icons.balance,
              context: context,
              onTap: onTapCourtForm,
              isSelected: selectedDrawerIndex == 1, // Check if selected
            ),
            10.verticalSpace,
            buildDrawerIconContainer(
              label: "Initiating Party",
              icon: CupertinoIcons.pencil,
              context: context,
              onTap: onTapCaseDashboard,
              isSelected: selectedDrawerIndex == 2, // Check if selected
            ),
            10.verticalSpace,
            buildDrawerIconContainer(
              label: "ICADRP Feedback",
              icon: Icons.feedback,
              context: context,
              onTap: onTapCaseDashboard,
              isSelected: selectedDrawerIndex == 3, // Check if selected
            ),
            10.verticalSpace,
            buildDrawerIconContainer(
              label: "Case Details",
              icon: CupertinoIcons.doc_on_clipboard_fill,
              context: context,
              onTap: onTapCaseDashboard,
              isSelected: selectedDrawerIndex == 4, // Check if selected
            ),
            10.verticalSpace,
            buildDrawerIconContainer(
              label: "Mediator Details",
              icon: Icons.person_search,
              context: context,
              onTap: onTapCaseDashboard,
              isSelected: selectedDrawerIndex == 5, // Check if selected
            ),
            10.verticalSpace,
            buildDrawerIconContainer(
              label: "Settings",
              icon: Icons.settings,
              context: context,
              onTap: onTapSettings,
              isSelected: selectedDrawerIndex == 6, // Check if selected
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
              child: SizedBox(
                width: 157.w,
                child: CustomButton(
                  text: 'Logout',
                  onPressed: onLogOut,
                  // iconPath: AppIcons.logout,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerIconContainer({
    required String label,
    required IconData icon,
    required void Function() onTap,
    required bool isSelected,
    required BuildContext context, // Add isSelected parameter
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          // color: isSelected
          //     ? AppColors.red10
          //     : Colors.transparent, // Conditional background
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 22.sp,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            8.horizontalSpace,
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.gray500, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CustomDrawerModel viewModelBuilder(BuildContext context) =>
      CustomDrawerModel();
}
