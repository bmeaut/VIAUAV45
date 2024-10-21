import 'package:flutter_screenutil/flutter_screenutil.dart';

// As orientation changes are not supported in this demo,
// we can use finals instead of getters for the dimensions.
class AppDimensions {
  AppDimensions._();

  static final h4 = ScreenUtil().setHeight(4.0);
  static final h8 = ScreenUtil().setHeight(8.0);
  static final h12 = ScreenUtil().setHeight(12.0);
  static final h32 = ScreenUtil().setHeight(32.0);
  static final h36 = ScreenUtil().setHeight(36.0);
  static final h40 = ScreenUtil().setHeight(40.0);
  static final h48 = ScreenUtil().setHeight(48.0);
  static final h56 = ScreenUtil().setHeight(56.0);
  static final h80 = ScreenUtil().setHeight(80.0);
  static final h120 = ScreenUtil().setHeight(120.0);
  static final h320 = ScreenUtil().setHeight(320.0);
  static final h360 = ScreenUtil().setHeight(360.0);

  static final w12 = ScreenUtil().setWidth(12.0);
  static final w16 = ScreenUtil().setWidth(16.0);
  static final w24 = ScreenUtil().setWidth(25.0);
  static final w142 = ScreenUtil().setWidth(142.0);
  static final w160 = ScreenUtil().setWidth(160.0);
  static final w240 = ScreenUtil().setWidth(240.0);

  static final r4 = ScreenUtil().radius(4.0);
  static final r12 = ScreenUtil().radius(12.0);
  static final r24 = ScreenUtil().radius(24.0);
  static final r80 = ScreenUtil().radius(80.0);

  static final size24 = ScreenUtil().radius(24.0);
  static final size100 = ScreenUtil().radius(100.0);
  static final size300 = ScreenUtil().radius(300.0);
}
