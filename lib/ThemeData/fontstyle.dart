import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontStyle {
  static Color primaryColor = Color.fromRGBO(1, 22, 30, 1);
  static Color secondaryColor = Color.fromRGBO(241, 216, 106,
      1); //(251,217,137,1);//(137, 207, 230, 1);//(199,232,243, 1);
  static Color secondaryColorWithOpacity = secondaryColor.withOpacity(0.5);
  static Color middleColor = Color.fromRGBO(3, 72, 99, 1);
  static Color dividerColor = Color.fromRGBO(2, 43, 60, 1);

//to set the label for input text field
  static InputDecoration setLable(var lable, var sufix, BuildContext context) {
    return InputDecoration(
      //isDense: true,
      labelText: lable,
      counterText: "",
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: FontStyle.secondaryColorWithOpacity,
          width: 1.5,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: FontStyle.secondaryColorWithOpacity, width: 1.5),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: FontStyle.secondaryColorWithOpacity, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.5),
      ),
      border: OutlineInputBorder(
        borderSide:
            BorderSide(color: FontStyle.secondaryColorWithOpacity, width: 1.5),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 10.0.w),
      labelStyle: productsansMedium(secondaryColor, 12.0),
      suffixIcon: sufix,
    );
  }

  static InputDecoration setLableUnderline(
      var lable, var sufix, BuildContext context, Color color) {
    return InputDecoration(
      //isDense: true,
      labelText: lable,
      counterText: "",
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1.5,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: color, width: 1.5),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: color, width: 1.5),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.5),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.5),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: color, width: 1.5),
      ),
      contentPadding: EdgeInsets.only(top: 12.0.h, bottom: 5.0.h),
      labelStyle: productsansMedium(color, 14.0),
      alignLabelWithHint: false,
      suffixIcon: sufix,
    );
  }

  static TextStyle textFieldStyle() {
    return productsansMedium(secondaryColor, null);
  }

  static TextStyle productsansBlack(Color primary, double f1_32) {
    return TextStyle(
      fontFamily: "ProductSans",
      fontWeight: FontWeight.w800,
      color: primary == null ? primaryColor : primary,
      fontSize: f1_32 == null
          ? ScreenUtil().setSp(32.0, allowFontScalingSelf: true)
          : ScreenUtil().setSp(f1_32, allowFontScalingSelf: true),
    );
  }

  static TextStyle productsansExtraBold(Color primary, double f3_20) {
    return TextStyle(
      fontFamily: "ProductSans",
      fontWeight: FontWeight.w900,
      color: primary == null ? primaryColor : primary,
      fontSize: f3_20 == null
          ? ScreenUtil().setSp(19, allowFontScalingSelf: true)
          : ScreenUtil().setSp(f3_20, allowFontScalingSelf: true),
    );
  }

  static TextStyle productsansBold(Color primary, double f3_19) {
    return TextStyle(
      fontFamily: "ProductSans",
      fontWeight: FontWeight.w700,
      color: primary == null ? primaryColor : primary,
      fontSize: f3_19 == null
          ? ScreenUtil().setSp(19, allowFontScalingSelf: true)
          : ScreenUtil().setSp(f3_19, allowFontScalingSelf: true),
    );
  }

  static TextStyle productsansBoldUnderline(Color primary, double f3_19) {
    return TextStyle(
      fontFamily: "ProductSans",
      fontWeight: FontWeight.w700,
      color: primary == null ? primaryColor : primary,
      decoration: TextDecoration.underline,
      fontSize: f3_19 == null
          ? ScreenUtil().setSp(19, allowFontScalingSelf: true)
          : ScreenUtil().setSp(f3_19, allowFontScalingSelf: true),
    );
  }

  static TextStyle productsansSemiBold(Color primary, double f5_14) {
    return TextStyle(
      fontFamily: "ProductSans",
      fontWeight: FontWeight.w600,
      color: primary == null ? primaryColor : primary,
      fontSize: f5_14 == null
          ? ScreenUtil().setSp(14, allowFontScalingSelf: true)
          : ScreenUtil().setSp(f5_14, allowFontScalingSelf: true),
    );
  }

  static TextStyle productsansSemiBoldUnderline(Color primary, double f5_14) {
    return TextStyle(
      fontFamily: "ProductSans",
      fontWeight: FontWeight.w600,
      color: primary == null ? primaryColor : primary,
      decoration: TextDecoration.underline,
      fontSize: f5_14 == null
          ? ScreenUtil().setSp(14, allowFontScalingSelf: true)
          : ScreenUtil().setSp(f5_14, allowFontScalingSelf: true),
    );
  }

  static TextStyle productsansMedium(Color primary, double f4_16) {
    return TextStyle(
      fontFamily: "ProductSans",
      fontWeight: FontWeight.w400,
      color: primary == null ? primaryColor : primary,
      fontSize: f4_16 == null
          ? ScreenUtil().setSp(16, allowFontScalingSelf: true)
          : ScreenUtil().setSp(f4_16, allowFontScalingSelf: true),
    );
  }

  static TextStyle productsansRegular(Color primary, double f6_12) {
    return TextStyle(
      fontFamily: "ProductSans",
      fontWeight: FontWeight.w300,
      color: primary == null ? primaryColor : primary,
      fontSize: f6_12 == null
          ? ScreenUtil().setSp(12, allowFontScalingSelf: true)
          : ScreenUtil().setSp(f6_12, allowFontScalingSelf: true),
    );
  }

  static TextStyle productsansRegularUnderline(Color primary, double f6_12) {
    return TextStyle(
      fontFamily: "ProductSans",
      fontWeight: FontWeight.w300,
      color: primary == null ? primaryColor : primary,
      fontSize: f6_12 == null
          ? ScreenUtil().setSp(12, allowFontScalingSelf: true)
          : ScreenUtil().setSp(f6_12, allowFontScalingSelf: true),
      decoration: TextDecoration.underline,
      decorationColor: primary == null ? primaryColor : primary,
    );
  }

  static TextStyle productsansLight(Color primary, double f6_12) {
    return TextStyle(
      fontFamily: "ProductSans",
      fontWeight: FontWeight.w300,
      color: primary == null ? primaryColor : primary,
      fontSize: f6_12 == null
          ? ScreenUtil().setSp(12, allowFontScalingSelf: true)
          : ScreenUtil().setSp(f6_12, allowFontScalingSelf: true),
    );
  }

  static TextStyle productsansThin(Color primary, double f7_14) {
    return TextStyle(
      fontFamily: "ProductSans",
      fontWeight: FontWeight.w300,
      color: primary == null ? primaryColor : primary,
      fontSize: f7_14 == null
          ? ScreenUtil().setSp(14, allowFontScalingSelf: true)
          : ScreenUtil().setSp(f7_14, allowFontScalingSelf: true),
    );
  }

  static TextStyle productsansThinUnderline(Color primary, double f7_14) {
    return TextStyle(
        fontFamily: "ProductSans",
        fontWeight: FontWeight.w300,
        color: primary == null ? primaryColor : primary,
        fontSize: f7_14 == null
            ? ScreenUtil().setSp(14, allowFontScalingSelf: true)
            : ScreenUtil().setSp(f7_14, allowFontScalingSelf: true),
        decoration: TextDecoration.underline,
        decorationColor: primaryColor);
  }
}
