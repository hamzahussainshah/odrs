import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odrs/ui/common/app_colors.dart';
import 'package:odrs/ui/widgets/phone_field.dart';
import 'package:stacked/stacked.dart';

import '../../common/assets.dart';
import '../../widgets/button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/text_field.dart';
import 'signup_viewmodel.dart';

class SignupView extends StackedView<SignupViewModel> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomImageView(
                      imagePath: AppImages.appLogo,
                      height: 50.0,
                      width: 50.0,
                      fit: BoxFit.contain,
                    ),
                    10.horizontalSpace,
                    Text(
                      'ODRS',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
                30.verticalSpace,
                Text(
                  "Welcome to ODRS",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                20.verticalSpace,
                10.verticalSpace,
                CustomTextField(
                    hintText: "First Name",
                    controller: viewModel.firstNameController),
                10.verticalSpace,
                CustomTextField(
                    hintText: "Middle Name",
                    controller: viewModel.middleNameController),
                10.verticalSpace,
                CustomTextField(
                    hintText: "Last Name",
                    controller: viewModel.lastNameController),
                10.verticalSpace,
                CustomTextField(
                    hintText: "Email", controller: viewModel.emailController),
                20.verticalSpace,
                PhoneField(
                    controller: viewModel.phoneController,
                    countryCodeController: viewModel.phoneCountryController),
                10.verticalSpace,
                CustomTextField(
                    hintText: "Password",
                    obscure: viewModel.obscurePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        viewModel.obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: viewModel.togglePasswordVisibility,
                    ),
                    controller: viewModel.passwordController),
                10.verticalSpace,
                CustomTextField(
                    hintText: "Retype Password",
                    obscure: viewModel.obscureRetypePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        viewModel.obscureRetypePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: viewModel.toggleRetypePasswordVisibility,
                    ),
                    controller: viewModel.retypePasswordController),
                10.verticalSpace,
                Row(
                  children: [
                    Checkbox(
                      value: viewModel.termsAgreement,
                      onChanged: (value) {
                        viewModel.toggleTermsAgreement(value);
                      },
                    ),
                    Text(
                      "I agree to ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    InkWell(
                      onTap: viewModel.navigateToPricacyPolicyView,
                      child: Text(
                        "privacy policy & terms",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ),
                  ],
                ),
                CustomButton(text: "Signup", onPressed: () {}),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextButton(
                      onPressed: viewModel.navigateToLoginView,
                      child: Text(
                        "Sign in instead",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ),
                  ],
                ),
                40.verticalSpace
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
