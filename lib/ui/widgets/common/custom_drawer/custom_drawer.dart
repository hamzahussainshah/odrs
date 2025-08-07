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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.r)),
      backgroundColor: Theme.of(context).colorScheme.surface,
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
                  borderRadius: BorderRadius.circular(20.r),
                  child: Container(
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Colors.grey.shade800
                          : AppColors.gray50,
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
              isSelected: selectedDrawerIndex == 0,
            ),
            10.verticalSpace,
            buildDrawerIconContainer(
              label: "Court Form",
              icon: Icons.balance,
              context: context,
              onTap: onTapCourtForm,
              isSelected: selectedDrawerIndex == 1,
            ),
            10.verticalSpace,
            buildDrawerIconContainer(
              label: "Initiating Party",
              icon: Icons.person_add_alt_1,
              context: context,
              onTap: onTapInitiatingParty,
              isSelected: selectedDrawerIndex == 2,
            ),
            10.verticalSpace,
            buildDrawerIconContainer(
              label: "ICADRP Feedback",
              icon: Icons.feedback,
              context: context,
              onTap: onTapICADRPFeedback,
              isSelected: selectedDrawerIndex == 3,
            ),
            10.verticalSpace,
            buildDrawerIconContainer(
              label: "Case Details",
              icon: Icons.article,
              context: context,
              onTap: onTapCaseDetails,
              isSelected: selectedDrawerIndex == 4,
            ),
            10.verticalSpace,
            buildDrawerIconContainer(
              label: "Mediator Details",
              icon: Icons.person_search,
              context: context,
              onTap: onTapMediatorDetails,
              isSelected: selectedDrawerIndex == 5,
            ),
            10.verticalSpace,
            buildDrawerIconContainer(
              label: "Settings",
              icon: Icons.settings,
              context: context,
              onTap: onTapSettings,
              isSelected: selectedDrawerIndex == 6,
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
    required BuildContext context,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        margin: EdgeInsets.only(right: 16.w),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
          border: isSelected
              ? Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            width: 1,
          )
              : null,
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
            12.horizontalSpace,
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurface,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
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