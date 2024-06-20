import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quiz_app_2/controller/controllerModel.dart';
import 'package:quiz_app_2/constants.dart';
import 'package:quiz_app_2/view/result.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import "dart:async";
import "package:hovering/hovering.dart";

class Quiz extends StatefulWidget {
  Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int indexSelected = 1;
  int? index;
  ControllerModel controllerModel = Get.put(ControllerModel());
  Timer? timer;
  bool isHovering = false;

  changeTime() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        controllerModel.timerOnlyQesution += Duration(seconds: 1);
        if (controllerModel.timerOnlyQesution.inSeconds == 60 &&
            controllerModel.quizList.length - 1 == controllerModel.index) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Result()),
          );
        }

        if (controllerModel.timerOnlyQesution.inSeconds == 60) {
          if (timer.isActive) {
            timer.cancel();
          }
          controllerModel.changeIndex(8, 8);
          changeTime();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    changeTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Result()),
                );
              },
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),

      //
      //

      body: Stack(children: [
        WebsafeSvg.asset("assets/bg.svg",
            alignment: Alignment.topRight,
            width: 1500,
            height: 1200,
            fit: BoxFit.cover),
        SafeArea(
          child: Column(
            children: [
              //leaner progress bar
              Container(
                width: double.infinity,
                height: 35,
                margin: EdgeInsets.only(left: 14, right: 14),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff3f4768), width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Stack(
                  children: [
                    LinearPercentIndicator(
                      //leaner progress bar

                      animation: false,
                      animationDuration: 60,
                      lineHeight: 35,
                      barRadius: Radius.circular(50),
                      percent: controllerModel.timerOnlyQesution.inSeconds / 60,
                      padding: EdgeInsets.all(0),
                      linearStrokeCap: LinearStrokeCap.round,

                      linearGradient: kPrimaryGradient,
                      backgroundColor: const Color.fromARGB(0, 224, 224, 224),
                    ),
                    Positioned.fill(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding / 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${controllerModel.timerOnlyQesution.inSeconds} sec",
                            style: TextStyle(color: Colors.white),
                          ),
                          WebsafeSvg.asset("assets/clock.svg")
                        ],
                      ),
                    )),
                  ],
                ),
              ),

              SizedBox(
                height: 22,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
                // showing the index of the question
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Question ${controllerModel.index + 1}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: kSecondaryColor, fontSize: 26.4)),
                        Text("/${controllerModel.quizList.length}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: kSecondaryColor, fontSize: 21)),
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Divider(
                      color: Color(0xff3f4768),
                      thickness: 1.5,
                    ),
                  ],
                ),
              ),
              // card of the quizzes
              Expanded(
                  child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 14, right: 14),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 28,
                        )
                      ],
                    ),
                  ),
                  Container(
                    //height: 510,
                    margin: EdgeInsets.symmetric(
                        vertical: kDefaultFontSize,
                        horizontal: kDefaultFontSize),
                    padding: EdgeInsets.all(14),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${controllerModel.quizList[controllerModel.index].question}",
                          style: TextStyle(fontSize: 19),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          height: kDefaultPadding / 2,
                        ),
                        ...List.generate(4, (index2) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 65,
                                child: InkWell(
                                  onTap: () async {
                                    setState(() async {
                                      if (controllerModel
                                              .quizList[controllerModel.index]
                                              .answer ==
                                          index2) {
                                        indexSelected = index2;
                                        controllerModel
                                                .listColorBackground?[index2] =
                                            const Color.fromARGB(
                                                43, 76, 175, 79);
                                        controllerModel.listColor?[index2] =
                                            kGreenColor;
                                        controllerModel
                                                .listColorBorder![index2] =
                                            kGreenColor;
                                        controllerModel.listIcon?[index2] =
                                            Icons.done;
                                      } else {
                                        controllerModel.listColor?[index2] =
                                            kRedColor;
                                        controllerModel
                                                .listColorBorder![index2] =
                                            kRedColor;
                                        controllerModel
                                                .listColorBackground?[index2] =
                                            Color.fromARGB(43, 255, 0, 0);

                                        controllerModel.listColorBorder?[
                                            controllerModel
                                                .quizList[controllerModel.index]
                                                .answer] = kGreenColor;

                                        controllerModel.listColorBackground?[
                                            controllerModel
                                                .quizList[controllerModel.index]
                                                .answer] = const Color.fromARGB(
                                            43, 76, 175, 79);

                                        controllerModel.listIcon?[index2] =
                                            Icons.close;

                                        controllerModel.listColor?[
                                            controllerModel
                                                .quizList[controllerModel.index]
                                                .answer] = kGreenColor;
                                        controllerModel.listIcon?[
                                            controllerModel
                                                .quizList[controllerModel.index]
                                                .answer] = Icons.done;
                                      }
                                      await Future.delayed(
                                          Duration(seconds: 1));

                                      if (controllerModel.index ==
                                          controllerModel.quizList.length - 1) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Result()),
                                        );
                                      }
                                      timer!.cancel();
                                      controllerModel.changeIndex(
                                          index2,
                                          controllerModel
                                              .quizList[controllerModel.index]
                                              .answer);
                                      controllerModel.update();
                                      changeTime();
                                    });
                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(left: 17, right: 13),
                                    decoration: BoxDecoration(
                                        color: controllerModel
                                            .listColorBackground![index2],
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(
                                            color: controllerModel
                                                .listColorBorder![index2])),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controllerModel
                                              .quizList[controllerModel.index]
                                              .options[index2],
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: controllerModel
                                                  .listColor?[index2],
                                              border: Border.all(
                                                  width: 1,
                                                  color: controllerModel
                                                          .listColorBorder![
                                                      index2]),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Icon(
                                            controllerModel.listIcon?[index2],
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ))
            ],
          ),
        )
      ]),
    );
  }
}
