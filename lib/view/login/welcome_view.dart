import 'package:flutter/material.dart';
import 'package:my_texi/common/color_extension.dart';
import 'package:my_texi/common_widget/round_botton.dart';
import 'package:my_texi/view/login/sign_in.dart';
import 'package:my_texi/view/login/sign_up.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/img/welcome_bg.png",
            width: context.width,
            height: context.height,
            fit: BoxFit.cover,
          ),
          Container(
            width: context.width,
            height: context.height,
            color: Colors.black.withOpacity(0.8),
          ),
          SafeArea(
            child: Column(
              children: [
                Image.asset(
                  "assets/img/app_logo.png",
                  width: context.width * 0.25,
                ),
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: RoundButton(
                      title: "SIGN IN",
                      onPress: () {
                        context.push(const SignInView());
                      }),
                ),
                TextButton(
                  onPressed: () {
                    context.push(const SignUpView());
                  },
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                        color: TColor.primarytext,
                        fontSize: 16,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
