import 'package:flutter/material.dart';
import 'package:my_texi/common/color_extension.dart';
import 'package:my_texi/common_widget/doccument_row.dart';
import 'package:my_texi/common_widget/round_botton.dart';
import 'package:my_texi/view/login/add_vehicle.dart';

class DocumentView extends StatefulWidget {
  final String title;

  const DocumentView({super.key, required this.title});

  @override
  State<DocumentView> createState() => _DocumentViewState();
}

class _DocumentViewState extends State<DocumentView> {
  List documentList = [
    {
      "Name": "Birth Certificate",
      "Detail": "Vehicle Registration",
      "info": "",
      "status": DocumentStatus.uploaded
    },
    {
      "Name": "Driving Licence",
      "Detail": "A driving license is an official do....",
      "info": "",
      "status": DocumentStatus.uploading
    },
    {
      "Name": "Passport",
      "Detail": "A passport is a travel document....",
      "info": "",
      "status": DocumentStatus.upload
    },
    {
      "Name": "Election card",
      "Detail": "Incorrect document....",
      "info": "",
      "status": DocumentStatus.upload
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
        title: Text(
          widget.title,
          style: TextStyle(
              color: TColor.primarytext,
              fontSize: 25,
              fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var dobj = documentList[index] as Map? ?? {};
                  return DocumentRow(
                    dObj: dobj,
                    onpress: () {},
                    info: () {
                      showModalBottomSheet(context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context){
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 46, horizontal: 20),
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          decoration: BoxDecoration(color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12, blurRadius: 3
                            )
                          ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Birth Cretificate",
                                style: TextStyle(
                                    color: TColor.primarytext,
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 15,
                              ),

                              Expanded(
                                child: SingleChildScrollView(
                                  child: Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n \n Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n \n  It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,\n \n and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                    style: TextStyle(
                                        color: TColor.secondarytext,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                TextButton(
                                  onPressed: (){
                                    context.pop();
                                  },
                                  child: Text(
                                    "Okay",
                                    style: TextStyle(color: TColor.primarytext, fontSize: 17, fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],),
                            ],
                          ),
                        );
                          });
                    },
                    upload: () {},
                    action: () {},
                    status: dobj["status"] as DocumentStatus? ??
                        DocumentStatus.upload,
                  );
                },
                itemCount: documentList.length,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "I confirm that i have read & agree to the",
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
                  Text(
                    "Terms & conditions",
                    style: TextStyle(
                      color: TColor.primarytext,
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    "and",
                    style: TextStyle(
                      color: TColor.secondarytext,
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    "Privacy policy",
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
                context.push(const AddVehicle());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
