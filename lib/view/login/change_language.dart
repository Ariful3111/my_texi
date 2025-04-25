import 'package:flutter/material.dart';
import 'package:my_texi/common/color_extension.dart';
import 'package:my_texi/view/login/welcome_view.dart';
class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {

  int SelectionChange =0;

  List languagelist=[
    "Arabic",
    "Bangla",
    "Chinese",
    "English",
    "Korean",
    "Urdu"
  ];

  @override
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
            Text("Chose Language",
            style: TextStyle(
              color: TColor.primarytext,
              fontSize: 25,
              fontWeight: FontWeight.w800
            ),
            ),
           const SizedBox(height: 15,),

            Expanded(child:
            ListView.builder(
              itemCount: languagelist.length,
                itemBuilder:( context, index){
                return ListTile(
                  onTap: (){
                    setState(() {
                      SelectionChange = index;
                    });
                    context.push(const WelcomeView());
                  },
                  title: Text(languagelist[index],
                  style: TextStyle(
                    color: TColor.primarytext,
                    fontSize: 16,
                    fontWeight: FontWeight.w800
                  ),
                  ),
                  trailing: index == SelectionChange ? Image.asset("assets/img/check_tick.png",
                  width: 25,
                  ) : null
                );
                } ),

            ),
          ],
        ),
      ),
    );
  }
}
