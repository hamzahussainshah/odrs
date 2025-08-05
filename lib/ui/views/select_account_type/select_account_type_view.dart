import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odrs/ui/common/assets.dart';
import 'package:odrs/ui/widgets/app_bar.dart';
import 'package:odrs/ui/widgets/button.dart';
import 'package:odrs/ui/widgets/custom_image_view.dart';
import 'package:stacked/stacked.dart';

import 'select_account_type_viewmodel.dart';

class SelectAccountTypeView extends StackedView<SelectAccountTypeViewModel> {
  const SelectAccountTypeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SelectAccountTypeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Column(
              children: [
                20.verticalSpace,
                Text(
                  "Welcome to the Online Dispute Resolution System. Choose the type of account you'd like to open or explore support options below.",
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                20.verticalSpace,
                buildAccountTypeContainer(
                  context: context,
                  title: "Request for Mediation",
                  bodyText: "Party registration for a new Mediation case",
                  onPressed: () => viewModel.navigateToRegistrationView(),
                ),
                20.verticalSpace,
                buildAccountTypeContainer(
                  context: context,
                  title: "Mediator",
                  bodyText: "New Mediator registration",
                  onPressed: () => viewModel.navigateToRegistrationView(),
                ),
                20.verticalSpace,
                buildAccountTypeContainer(
                  context: context,
                  title: "Case Manager",
                  bodyText: "New Case Manager Registration",
                  onPressed: () => viewModel.navigateToRegistrationView(),
                ),
                20.verticalSpace,
                buildAccountTypeContainer(
                  context: context,
                  title: "Create a Court User account",
                  bodyText: "Do you want to create a Court user account",
                  onPressed: () => viewModel.navigateToRegistrationView(),
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildAccountTypeContainer({
    required BuildContext context,
    required String title,
    required String bodyText,
    required VoidCallback onPressed,
  }) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          10.verticalSpace,
          Text(
            bodyText,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          20.verticalSpace,
          CustomButton(
            text: "Open An Account",
            onPressed: onPressed,
          )
        ],
      ),
    );
  }

  @override
  SelectAccountTypeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SelectAccountTypeViewModel();
}
