import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quiz_app_2/constants.dart';
import 'package:quiz_app_2/controller/controllerModel.dart';
import 'package:quiz_app_2/view/quiz.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  ControllerModel controllerModel = Get.put(ControllerModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      WebsafeSvg.asset("assets/bg.svg",
          alignment: Alignment.topRight,
          width: 1500,
          height: 1200,
          fit: BoxFit.cover),
      SafeArea(
          child: Column(
        children: [
          Spacer(
            flex: 6,
          ),
          Center(
            child: Text(
              "Hi ${controllerModel.fullName}",
              style: TextStyle(
                  color: kGrayColor, fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "Score:",
            style: TextStyle(
                color: kGrayColor, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Center(
              child: Text(
            "${((controllerModel.result / (controllerModel.quizList.length * 10)) * 100).round()}%",
            style: TextStyle(
                color: kGrayColor, fontSize: 28, fontWeight: FontWeight.bold),
          )),
          Center(
            child:(((controllerModel.result / (controllerModel.quizList.length * 10)) * 100).round())<60? Text(
              "😿",
              style: TextStyle(fontSize: 50),
            ): Text(
              "😻",
              style: TextStyle(fontSize: 50),
            ),
          ),
          Spacer(
            flex: 2,
          ),
          OutlinedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(kGrayColor)),
              onPressed: () {
                controllerModel.index = 0;
                for (var i = 0; i < 4; i++) {
                  controllerModel.listColor?[i]=Colors.white;
                  controllerModel.listIcon?[i]=Icons.close;
                }
                controllerModel.result = 0;
                  Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Quiz()),
                                        );

              },
              child: Text("Restart",
                  style: TextStyle(fontSize: 20, color: Colors.black87))),
          Spacer(
            flex: 6,
          )
        ],
      ))
    ]));
  }
}
