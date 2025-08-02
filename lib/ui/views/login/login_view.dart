import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odrs/ui/common/assets.dart';
import 'package:odrs/ui/widgets/button.dart';
import 'package:odrs/ui/widgets/custom_image_view.dart';
import 'package:odrs/ui/widgets/text_field.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Column(
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
              CustomTextField(
                  hintText: "Mobile Number",
                  controller: viewModel.mobileController),
              10.verticalSpace,
              CustomTextField(
                  hintText: "Password",
                  obscure: viewModel.obscureText,
                  suffixIcon: IconButton(
                    icon: Icon(
                      viewModel.obscureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: viewModel.togglePasswordVisibility,
                  ),
                  controller: viewModel.passwordController),
              20.verticalSpace,
              Row(
                children: [
                  Checkbox(
                    value: viewModel.rememberMe,
                    onChanged: (value) {
                      viewModel.toggleRememberMe(value);
                    },
                  ),
                  Text(
                    "Remember Me",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Spacer(),
                  InkWell(
                    onTap: viewModel.navigateToForgotPasswordView,
                    child: Text(
                      "Forgot Password?",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                ],
              ),
              CustomButton(text: "Login", onPressed: () {}),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New to ICADRP? ",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextButton(
                    onPressed: viewModel.navigateToSignUpView,
                    child: Text(
                      "Open an account",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
