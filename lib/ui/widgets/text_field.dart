import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/app_colors.dart';
import '../common/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final FocusNode? focusNode;
  final String? Function(String?)? validate;
  final void Function(String)? onChanged;
  final bool obscure;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final String? suffixText;
  final Function(String)? onFieldSubmitted;
  final Function()? onTapSuffix;
  final bool? readOnly;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.onChanged,
    this.validate,
    this.prefixIcon,
    this.suffixIcon,
    this.obscure = false,
    this.keyboardType,
    this.onTap,
    this.suffixText,
    this.maxLines,
    this.focusNode,
    this.onFieldSubmitted,
    this.onTapSuffix,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      maxLines: maxLines ?? 1,
      onTap: onTap,
      readOnly: readOnly ?? false,
      keyboardType: keyboardType,
      cursorColor: AppColors.black,
      cursorHeight: 22.h,
      cursorWidth: 1.w,
      cursorRadius: Radius.circular(0.3.r),
      textAlignVertical: TextAlignVertical.center,
      obscureText: obscure,
      controller: controller,
      obscuringCharacter: '*',
      onChanged: onChanged,
      validator: validate,
      focusNode: focusNode,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffix: Text(
          suffixText ?? '',
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: AppColors.gray500,
              ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 16.w,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        hintStyle: Theme.of(context).textTheme.displaySmall!,
        filled: true,
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        labelText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: AppColors.darkBlue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: AppColors.gray300,
            width: 1.5.w,
          ),
        ),
        floatingLabelStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: AppColors.gray500, // Style when label is on border
            ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: onTapSuffix,
                child: suffixIcon,
              )
            : null,
      ),
    );
  }
}
