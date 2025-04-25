import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:my_texi/common/color_extension.dart';
import 'package:my_texi/common_widget/line_text_filled.dart';
import 'package:my_texi/common_widget/round_botton.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  FlCountryCodePicker countryCodePicker = const FlCountryCodePicker();

  late CountryCode countryCode;

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign In",
              style: TextStyle(
                  color: TColor.primarytext,
                  fontSize: 25,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 30,
            ),
            Text("Mobile Number", style: TextStyle(
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
            LineTextField(
              title: "Password",
              hintText: "*****",
              obscuretext: true,
              controller: password,
              right: IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/img/password_show.png", width: 15, height: 15,),
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 8,
            ),
            const SizedBox(
              height: 15,
            ),
            RoundButton(title: "SIGN IN", onPress: () {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "FORGOT PASSWORD",
                    style: TextStyle(
                        color: TColor.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w800),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
