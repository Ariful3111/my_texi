import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class IconTitleButtton extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  final VoidCallback onpress;
  const IconTitleButtton({super.key, required this.title, required this.subtitle, required this.icon, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Column(
        children: [
          Image.asset(
            icon,
            width: 20,
            height: 20,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: TColor.primarytext,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: TColor.primarytext,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
