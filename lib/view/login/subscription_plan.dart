import 'package:flutter/material.dart';
import 'package:my_texi/common/color_extension.dart';
import 'package:my_texi/common_widget/plan_row.dart';

class SubscriptionPlan extends StatefulWidget {
  const SubscriptionPlan({super.key});

  @override
  State<SubscriptionPlan> createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<SubscriptionPlan> {

  List plan = [
    {
      "name":"Basic plan",
      "time":"1 Month",
      "rides":"10 rides everyday",
      "cash_rides":"2 cash rides",
      "km":"50km travel rides",
      "price":"Try free",
    },
    {
      "name":"Classic plan",
      "time":"3 Month",
      "rides":"10 rides everyday",
      "cash_rides":"2 cash rides",
      "km":"50km travel rides",
      "price":"Buy at\$20",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Image.asset("assets/img/back.png", width: 25, height: 25),
        ),
        centerTitle: true,
        title: Text("Subscription Plan",
          style: TextStyle(
              color: TColor.primarytext,
              fontSize: 25,
              fontWeight: FontWeight.w800
          ),
        ),
      ),
      backgroundColor: TColor.bg,
      body:ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          itemCount: plan.length,
          itemBuilder:(context, index){
          var pObj = plan[index] as Map? ?? {};
          return PlanRow(pObj: pObj,
              onpress: (){

              });
          }
      )
    );
  }
}
