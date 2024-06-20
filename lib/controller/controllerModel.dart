import "package:flutter/material.dart";
import "package:get/get.dart";
import "../model/QuestionsModel.dart";

class ControllerModel extends GetxController {
List<Questions> quizList =
 [
Questions(

    id: 1,
    question:
        "Flutter is an open-source UI software development kit created by ______",
    options: ['Apple', 'Google', 'Facebook', 'Microsoft'],
    answer: 1,
),
Questions(
    id: 2,
    question: "When google release Flutter.",
    options: ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    answer: 2,
),
Questions(
    id: 3,
    question: "A memory location that holds a single letter or number.",
    options: ['Double', 'Int', 'Char', 'Word'],
    answer: 2,
),
Questions(
    id: 4,
    question: "What command do you use to output data to the screen?",
    options: ['Cin', 'Count>>', 'Cout', 'Output>>'],
    answer: 2,
),
Questions(
    id: 5,
    question:
        "It is very necessary to learn Dart language for building Flutter application?",
    options: ['Yes', 'No', 'Can be yes or no', ' Can not say'],
    answer: 1,
),
Questions(
    id: 6,
    question: "Flutter developed by?.",
    options: ['Oracle', 'Facebook', 'Google', ' IBM'],
    answer: 3,
),
Questions(
    id: 7,
    question: "Flutter is not a language; it is an SDK.",
    options: ['TRUE', 'FALSE', ' Can be true or false', 'Can not say'],
    answer: 1,
),
Questions(
    id: 8,
    question: "The first alpha version of Flutter was released in ?",
    options: ['2016', '2017', '2018', '2019'],
    answer: 2,
),
  Questions(
    id: 9,
    question: "Flutter is mainly optimized for 2D mobile apps that can run on?",
    options: ['Android', 'iOS', 'Both A and B', 'None of the above'],
    answer: 3,
  ),
Questions(
    id: 10,
    question:
        "FWhich programming language is used to build Flutter applications?_",
    options: ['Kotlin', 'Dart', 'Java', 'Go'],
    answer: 1,
),
];

  int index = 0;
  int result = 0;
  List<Color>? listColorBackground = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];
  List<Color>? listColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];
  List<Color>? listColorBorder = [
    Colors.black45,
    Colors.black45,
    Colors.black45,
    Colors.black45
  ];
  List<IconData>? listIcon = [
    Icons.close,
    Icons.close,
    Icons.close,
    Icons.close,
  ];

  String fullName = "";
  Duration timerOnlyQesution = Duration(seconds: 0);

  changeIndex(inde, int answer)  async {
    if (index != quizList.length - 1) {
      index++;
    }
    timerOnlyQesution = Duration(seconds: 0);
    //await Future.delayed(  Duration(seconds: 1));
  
  if (inde!=8&&answer!=8) {
    
    listColor?[inde] = Colors.white;
    listColorBackground?[inde] = Colors.white;
    listColorBackground?[answer] = Colors.white;
    listColorBorder?[inde] = Colors.black45;
    listColorBorder?[answer] = Colors.black45;
    listIcon?[inde] = Icons.close;
    listColor?[answer] = Colors.white;
    listIcon?[answer] = Icons.close;
    if (inde == answer) {
      result += 10;
    }
    
  }
    if (index == 0) {
      result = 0;
    }


    update();
  }
}

