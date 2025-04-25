import 'package:flutter/material.dart';
import 'package:my_texi/common/color_extension.dart';

class LineTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardtype;
  final bool? obscuretext;
  final Widget? right;
  const LineTextField(
      {super.key,
      required this.title,
      required this.hintText,
      this.controller,
      this.keyboardtype,
      this.obscuretext,
      this.right});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(
            color: TColor.placeholder,
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 30,
          child: TextField(
            controller: controller,
            keyboardType: keyboardtype,
            obscureText: obscuretext ?? false,
            style: TextStyle(
              color: TColor.primarytext,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: hintText,
              suffixIcon: right,
              hintStyle: TextStyle(
                color: TColor.secondarytext,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Container(
          color: TColor.lightgray,
          height: 0.5,
          width: double.maxFinite,
        ),
      ],
    );
  }
}
