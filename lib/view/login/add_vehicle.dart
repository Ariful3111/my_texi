import 'package:flutter/material.dart';
import 'package:my_texi/common/color_extension.dart';
import 'package:my_texi/common_widget/line_text_filled.dart';
import 'package:my_texi/common_widget/round_botton.dart';
import 'package:my_texi/view/login/vehicle_document.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key});

  @override
  State<AddVehicle> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<AddVehicle> {

  TextEditingController service = TextEditingController();
  TextEditingController brand_name = TextEditingController();
  TextEditingController model_name = TextEditingController();
  TextEditingController manufacture = TextEditingController();
  TextEditingController number_plate = TextEditingController();
  TextEditingController color = TextEditingController();
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
        title: Text("Add Vehicle",
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
              const SizedBox(
                height: 30,
              ),
              LineTextField(
                title: "Service Type",
                hintText: "Ex Micro",
                controller: service,
              ),

              const SizedBox(
                height: 8,
              ),
              LineTextField(
                title: "Brand",
                hintText: "Ex BMW",
                controller: brand_name,
              ),

              const SizedBox(
                height: 8,
              ),
              LineTextField(
                title: "Model",
                hintText: "EX ABC",
                controller: model_name,
              ),

              const SizedBox(
                height: 8,
              ),LineTextField(
                title: "Manufacture",
                hintText: "BMW",
                controller: manufacture,
              ),

              const SizedBox(
                height: 8,
              ),
              LineTextField(
                title: "Number Plate",
                hintText: "YT1234",
                controller: number_plate,
              ),
              const SizedBox(
                height: 8,
              ),
              LineTextField(
                title: "Color",
                hintText: "Black",
                controller: color,
              ),

              const SizedBox(
                height: 8,
              ),

              RoundButton(title: "REGISTER", onPress: () {
                context.push(const VehicleDocument());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
