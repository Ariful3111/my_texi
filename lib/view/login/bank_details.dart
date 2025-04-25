import 'package:flutter/material.dart';
import 'package:my_texi/common/color_extension.dart';
import 'package:my_texi/common_widget/line_text_filled.dart';
import 'package:my_texi/common_widget/round_botton.dart';
import 'package:my_texi/view/login/document_view.dart';

class BankDetails extends StatefulWidget {
  const BankDetails({super.key});

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {

  TextEditingController bankname = TextEditingController();
  TextEditingController account_holder_name = TextEditingController();
  TextEditingController account_number = TextEditingController();
  TextEditingController swift_code = TextEditingController();
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
        title: Text("Bank Details",
        style: TextStyle(
          color: TColor.primarytext,
          fontSize: 25,
          fontWeight: FontWeight.w800
        ),
        ),
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Crate Profile",
                style: TextStyle(
                    color: TColor.primarytext,
                    fontSize: 25,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 30,
              ),
              LineTextField(
                title: "Bank Name",
                hintText: "Ex UCB",
                controller: bankname,
              ),

              const SizedBox(
                height: 8,
              ),
              LineTextField(
                title: "Account Holder Name",
                hintText: "Ex Ariful Islam",
                controller: account_holder_name,
              ),

              const SizedBox(
                height: 8,
              ),
              LineTextField(
                title: "Account Number",
                hintText: "205534285464",
                controller: account_number,
              ),

              const SizedBox(
                height: 8,
              ),
              LineTextField(
                title: "Swift Code",
                hintText: "UCB20523",
                controller: swift_code,
                right: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/img/password_show.png",
                    width: 15,
                    height: 15,
                  ),
                ),
              ),

              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("I confirm that i have read & agree to the",
                    style: TextStyle(
                      color: TColor.secondarytext,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Terms & conditions",
                    style: TextStyle(
                      color: TColor.primarytext,
                      fontSize: 11,
                    ),
                  ),
                  Text("and",
                    style: TextStyle(
                      color: TColor.secondarytext,
                      fontSize: 11,
                    ),
                  ),
                  Text("Privacy policy",
                    style: TextStyle(
                      color: TColor.primarytext,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              RoundButton(title: "NEXT", onPress: () {
                context.push(const DocumentView(title: "personal Document",));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
