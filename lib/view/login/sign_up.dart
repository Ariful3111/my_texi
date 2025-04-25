import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:my_texi/common/color_extension.dart';
import 'package:my_texi/common_widget/line_text_filled.dart';
import 'package:my_texi/common_widget/round_botton.dart';
import 'package:my_texi/view/login/bank_details.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  FlCountryCodePicker countryCodePicker = const FlCountryCodePicker();

  late CountryCode countryCode;

  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController homeaddress = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    countryCode = countryCodePicker.countryCodes
        .firstWhere((element) => element.name == "Bangladesh");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Image.asset("assets/img/back.png", width: 25, height: 25),
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
                title: "First Name",
                hintText: "Ex Ariful",
                controller: firstname,
              ),

              const SizedBox(
                height: 8,
              ),
              LineTextField(
                title: "Last Name",
                hintText: "Ex Islam",
                controller: lastname,
              ),

              const SizedBox(
                height: 8,
              ),
              Text(
                "Mobile Number",
                style: TextStyle(
                  color: TColor.placeholder,
                  fontSize: 16,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () async {
                      final code =
                          await countryCodePicker.showPicker(context: context);
                      if (code != null) {
                        countryCode = code;
                        setState(() {});
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 30,
                          height: 20,
                          child: countryCode.flagImage(),
                        ),
                        Text(
                          "${countryCode.dialCode}",
                          style: TextStyle(
                            color: TColor.primarytext,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: mobile,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: "1234567890",
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 8,
              ),
              LineTextField(
                title: "Home Address",
                hintText: "Basta, Singair, Manikgonj, Dhaka, Bangladesh",
                controller: homeaddress,
              ),

              const SizedBox(
                height: 8,
              ),
              LineTextField(
                title: "Password",
                hintText: "*****",
                controller: password,
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
              RoundButton(title: "SIGN REGISTER", onPress: () {
                context.push(const BankDetails());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
