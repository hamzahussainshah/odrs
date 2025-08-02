import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common/app_colors.dart';
import '../common/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.elevation,
    this.minimumSize,
    this.iconPath,
    this.isDisabled = false,
    this.isBgColor = true,
    required this.text,
    required this.onPressed,
    this.textColor,
    this.borderColor,
    this.backgroundColor,
    this.buttonTextStyle,
  });
  final TextStyle? buttonTextStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final bool isDisabled;
  final bool isBgColor;
  final String? iconPath;
  final String text;
  final Size? minimumSize;
  final double? elevation;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isDisabled
            ? AppColors.gray100
            : isBgColor
            ? backgroundColor ?? AppColors.blueDark
            : AppColors.white,
        minimumSize: minimumSize ?? Size(double.infinity, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
          side: isDisabled
              ? BorderSide.none
              : BorderSide(color: borderColor ?? AppColors.blueDark),
        ),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPath != null) ...[
            SvgPicture.asset(
              iconPath!,
              height: 20.h,
              width: 20.w,
            ),
            8.horizontalSpace,
          ],
          Text(
            text,
            style: buttonTextStyle ??
                Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: isDisabled
                      ? AppColors.gray300
                      : !isBgColor
                      ? textColor ?? AppColors.darkBlue
                      : AppColors.white,
                ),
          ),
        ],
      ),
    );
  }
}
