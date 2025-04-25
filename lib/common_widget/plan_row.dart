import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class PlanRow extends StatelessWidget {
  final Map pObj;
  final VoidCallback onpress;
  const PlanRow({super.key, required this.pObj, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 1)
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pObj["name"] as String? ?? "",
            style: TextStyle(
                color: TColor.primarytext,
                fontSize: 18,
                ),
          ),
          const SizedBox(height: 4,),
          Text(
            pObj["time"] as String? ?? "",
            style: TextStyle(
                color: TColor.secondarytext,
                fontSize: 18,
                ),
          ),
          Text(
            pObj["rides"] as String? ?? "",
            style: TextStyle(
                color: TColor.secondarytext,
                fontSize: 18,
                ),
          ),
          Text(
            pObj["cash_rides"] as String? ?? "",
            style: TextStyle(
                color: TColor.secondarytext,
                fontSize: 18,
                ),
          ),
          Text(
            pObj["km"] as String? ?? "",
            style: TextStyle(
                color: TColor.secondarytext,
                fontSize: 18,
                ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: (){},
                  child: Text(
                    pObj["price"] as String? ?? "",
                    style: TextStyle(
                      color: TColor.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                    ),
                  ),)
            ],
          ),
        ],
      ),
    );
  }
}
