import 'package:flutter/material.dart';
import 'package:simple_package/src/helperUtils.dart';

class SimplePackage extends StatefulWidget {
  const SimplePackage({Key? key}) : super(key: key);

  @override
  State<SimplePackage> createState() => _SimplePackageState();
}

class _SimplePackageState extends State<SimplePackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: HelperUtils.getwidth(context),
      height: HelperUtils.getHeight(context),
      child: Column(
        children: [
          HelperUtils.containerField(),
          HelperUtils.customButton(
              context: context, buttonText: "Go", onPress: () {}),
          HelperUtils.mainButton(
              context: context, buttonText: "Continue", onPress: () {})
        ],
      ),
    ));
  }
}
