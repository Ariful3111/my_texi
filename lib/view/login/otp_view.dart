import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:my_texi/common/color_extension.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

import '../../common_widget/round_botton.dart';

class OTPView extends StatefulWidget {
  final String number;
  final String code;

  const OTPView({super.key, required this.number, required this.code});

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  @override
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "OTP Verification",
              style: TextStyle(
                  color: TColor.primarytext,
                  fontSize: 25,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Enter the 6-digit code sent to you get",
              style: TextStyle(
                color: TColor.secondarytext,
                fontSize: 11,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${widget.code} ${widget.number}",
                  style: TextStyle(
                    color: TColor.primarytext,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    "Edit",
                    style: TextStyle(
                      color: TColor.secondarytext,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            OtpTextField(
              numberOfFields: 6,
              borderColor: TColor.placeholder,
              focusedBorderColor: TColor.primary,
              textStyle: TextStyle(color: TColor.primarytext, fontSize: 16),
              showFieldAsBox: false,
              borderWidth: 4.0,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here if necessary
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {},
            ),
            const SizedBox(
              height: 15,
            ),
            RoundButton(title: "Submit", onPress: () {}),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OtpTimerButton(
                  height: 60,
                  onPressed: () {},
                  text: const Text(
                    'Send OTP ',
                    style: TextStyle(fontSize: 16),
                  ),
                  buttonType: ButtonType.text_button,
                  backgroundColor: TColor.primarytext,
                  duration: 60,
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
