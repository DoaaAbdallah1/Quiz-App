// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_2/controller/controllerModel.dart';
import 'package:quiz_app_2/view/quiz.dart';

import '../constants.dart';
import 'package:flutter/widgets.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Welcome extends StatelessWidget {
  Welcome({super.key});
  ControllerModel controllerModel = Get.put(ControllerModel());
  TextEditingController controller=Get.put(TextEditingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebsafeSvg.asset("assets/bg.svg",
              alignment: Alignment.topRight,
              width: 1500,
              height: 1200,
              fit: BoxFit.cover),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(
                  flex: 2,
                ),
                Text(
                  "Let's Play Quiz,",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text("Enter your informations below",
                    style: TextStyle(color: Colors.white)),
                Spacer(),
                TextField(
                  controller: controller,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    filled: true,
                    fillColor: Color(0xff1c2341),
                    hintStyle: TextStyle(color: Colors.white),
                    hoverColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    controllerModel.fullName=controller.text;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Quiz()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Text(
                      "lets start Quiz",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
