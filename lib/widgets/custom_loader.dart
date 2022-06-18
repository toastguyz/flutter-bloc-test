import 'package:flutter/material.dart';
import 'package:flutter_bloc_task/utils/app_color.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColor.themeColor));
  }
}
