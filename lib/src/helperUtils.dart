import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HelperUtils {
  static double getwidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static String getFormattedDate(DateTime date) {
    final DateFormat formatter = DateFormat.yMMMd();
    final String formatted = formatter.format(date);

    return formatted;
  }

  static containerField({
    double? radius,
    Color? color,
    double? height,
    double? width,
    Widget? child,
  }) {
    return Container(
      height: height ?? 50,
      width: width ?? 300,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(radius ?? 10),
      ),
    );
  }

  static customButton(
      {required BuildContext context,
      required String buttonText,
      required VoidCallback onPress,
      double? width,
      double? height,
      double? fontsize,
      Color? textColor,
      TextStyle? textStyle}) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: width ?? 300,
        height: height ?? 40,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            buttonText,
            style: textStyle ??
                TextStyle(
                  color: textColor,
                  fontSize: fontsize ?? 18,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }

  static mainButton({
    required BuildContext context,
    required String buttonText,
    required VoidCallback onPress,
    Color? backgroundcolor,
    Color? foregroundcolor,
    Color? overlaycolor,
  }) {
    ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                backgroundcolor ?? Colors.black),
            foregroundColor: MaterialStateProperty.all<Color>(
                foregroundcolor ?? Colors.white),
            overlayColor: MaterialStateProperty.all(overlaycolor)),
        child: Text(
          buttonText,
        ));
  }

  static Future<dynamic> navigatorGoNext(BuildContext context, Widget screen,
      {bool isFinish = false}) async {
    if (isFinish) {
      return await Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => screen));
    } else {
      return await Navigator.push(
          context, MaterialPageRoute(builder: (context) => screen));
    }
  }

  static goNextFinishAll(
    BuildContext context,
    Widget screen,
  ) =>
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => screen),
          (Route<dynamic> route) => false);

  static goBack(BuildContext context, {dynamic data}) => Navigator.pop(context);
}
