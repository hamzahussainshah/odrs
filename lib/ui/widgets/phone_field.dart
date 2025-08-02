import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/app_colors.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController countryCodeController;
  final Function(String)? onChanged;
  final Function(String)? onCountryChanged;
  final String? labelText;
  final String? hintText;
  final String initialCountryCode;
  final bool enabled;
  final bool readOnly;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  const PhoneField({
    required this.controller,
    required this.countryCodeController,
    this.onChanged,
    this.onCountryChanged,
    this.labelText = 'Phone Number',
    this.hintText,
    this.initialCountryCode = 'PK',
    this.enabled = true,
    this.readOnly = false,
    this.focusNode,
    this.textInputAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      style: Theme.of(context).textTheme.bodyMedium,
      dropdownTextStyle: Theme.of(context).textTheme.bodyMedium,

      decoration: InputDecoration(
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        filled: true,
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: AppColors.gray300,
            width: 1.5.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: AppColors.gray300,
            width: 1.5.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1,
          ),
        ),
      ),
      initialCountryCode: initialCountryCode,
      enabled: enabled,
      readOnly: readOnly,
      focusNode: focusNode,
      textInputAction: textInputAction,
      onChanged: (phone) {
        // Update the country code controller
        countryCodeController.text = phone.countryCode;

        // Call the onChanged callback if provided
        onChanged?.call(phone.completeNumber);

        // Call the onCountryChanged callback if provided
        onCountryChanged?.call(phone.countryCode);
      },
      onCountryChanged: (country) {
        // Update the country code controller
        countryCodeController.text = country.dialCode;

        // Call the onCountryChanged callback if provided
        onCountryChanged?.call(country.dialCode);
      },
    );
  }
}