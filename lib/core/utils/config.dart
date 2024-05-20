import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Config {
  static double get height => 1.sh;
  static double get width => 1.sw;

  static TextTheme get textTheme => TextTheme(
        titleLarge: GoogleFonts.sora(fontSize: 32.sp),
        titleMedium: GoogleFonts.sora(fontSize: 28.sp),
        titleSmall: GoogleFonts.sora(fontSize: 18.sp),
        bodyLarge: GoogleFonts.sora(fontSize: 16.sp),
        bodyMedium: GoogleFonts.sora(fontSize: 14.sp),
        bodySmall: GoogleFonts.sora(fontSize: 12.sp),
        labelLarge: GoogleFonts.sora(fontSize: 14.sp),
        labelMedium: GoogleFonts.sora(fontSize: 12.sp),
        labelSmall: GoogleFonts.sora(fontSize: 10.sp),
      );

  static EdgeInsets all(double padding) => EdgeInsets.all(padding.w);

  static EdgeInsets symmetric({double? h, double? v}) =>
      EdgeInsets.symmetric(horizontal: (h ?? 0).w, vertical: (v ?? 0).h);

  static EdgeInsets fromLTRB(double l, double t, double r, double b) =>
      EdgeInsets.fromLTRB(l.w, t.h, r.w, b.h);

  static double h(double height) => height.h;
  static double w(double width) => width.w;

  static SizedBox get hBox4 => 4.horizontalSpace;
  static SizedBox get hBox8 => 8.horizontalSpace;
  static SizedBox get hBox12 => 12.horizontalSpace;
  static SizedBox get hBox16 => 16.horizontalSpace;
  static SizedBox get hBox20 => 20.horizontalSpace;
  static SizedBox get hBox24 => 24.horizontalSpace;

  static SizedBox get vBox4 => 4.verticalSpace;
  static SizedBox get vBox8 => 8.verticalSpace;
  static SizedBox get vBox12 => 12.verticalSpace;
  static SizedBox get vBox16 => 16.verticalSpace;
  static SizedBox get vBox20 => 20.verticalSpace;
  static SizedBox get vBox24 => 24.verticalSpace;
  static SizedBox get vBox28 => 28.verticalSpace;
  static SizedBox get vBox40 => 40.verticalSpace;

  static Radius get radius8 => const Radius.circular(8);
  static Radius get radius16 => const Radius.circular(16);
  static Radius get radius24 => const Radius.circular(24);
  static Radius get radius32 => const Radius.circular(32);

  static Duration get duration300 => const Duration(milliseconds: 300);
  static Duration get duration500 => const Duration(milliseconds: 500);
  static Duration get duration600 => const Duration(milliseconds: 600);
  static Duration get duration1000 => const Duration(milliseconds: 1000);
  static Duration get duration1500 => const Duration(milliseconds: 1500);
  static Duration get duration2000 => const Duration(milliseconds: 2000);
}
