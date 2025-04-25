import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:my_texi/common/color_extension.dart';
import 'package:my_texi/common_widget/round_botton.dart';
import 'package:my_texi/view/login/otp_view.dart';
class MobileNumberView extends StatefulWidget {
  const MobileNumberView({super.key});

  @override
  State<MobileNumberView> createState() => _MobileNumberViewState();
}

class _MobileNumberViewState extends State<MobileNumberView> {

  FlCountryCodePicker countryCodePicker = const FlCountryCodePicker();

  late CountryCode countryCode;

  TextEditingController mobile= TextEditingController();
  @override

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    countryCode = countryCodePicker.countryCodes.firstWhere((element) => element.name == "Bangladesh");

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            context.pop();
          },
          icon: Image.asset("assets/img/back.png",
              width: 25,
              height: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Enter Mobile Number",
              style: TextStyle(
                  color: TColor.primarytext,
                  fontSize: 25,
                  fontWeight: FontWeight.w800
              ),
            ),
            const SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async{
                    final code = await countryCodePicker.showPicker(context: context);
                    if(code != null){
                      countryCode =code;
                      setState(() {
                        
                      });
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox( width: 30,
                      height: 20,
                      child: countryCode.flagImage(),
                      ),

                      Text("${countryCode.dialCode}",
                        style: TextStyle(
                            color: TColor.primarytext,
                            fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15,),
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
            const SizedBox(height: 8,),

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

            const SizedBox(height: 15,),

            RoundButton(title: "Continue", onPress: (){
              context.push(OTPView(number: '456131563', code: "+880"));
            }),

          ],
        ),
      ),
    );
  }
}
