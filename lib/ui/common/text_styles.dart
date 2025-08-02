import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class TextStyles {
  static TextStyle get largeBold => GoogleFonts.inter(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle get mediumLarge => GoogleFonts.inter(
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static TextStyle get medium => GoogleFonts.inter(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static TextStyle get smallLight => GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.gray800,
  );

  static TextStyle get regular => GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.gray800,
  );

  static TextStyle get small => GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.gray800,
  );
  static TextStyle get smallVeryLight => GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.gray800,
  );



  static TextStyle get extraSmall => GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.gray800,
  );
}