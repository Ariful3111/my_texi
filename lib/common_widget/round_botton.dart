import 'package:flutter/material.dart';
import 'package:my_texi/common/color_extension.dart';
class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const RoundButton({super.key, required this.title, required this.onPress});
  @override
  Widget build(BuildContext context) {


    return MaterialButton(onPressed: onPress,
    minWidth: double.maxFinite,
      elevation: 0,
      color: TColor.primary,
      height: 58,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25)
      ),
      child: Text(title,
        style: TextStyle(
            color: TColor.primarytextW,
            fontSize: 25,
            fontWeight: FontWeight.w800
        ),
      ),
    );
  }
}
