class Questions {
  final int id, answer;
  final String question;
  final List<String> options;

  Questions({required this.id,required this.question,required this.answer,required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "Flutter is an open-source UI software development kit created by ______",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "When google release Flutter.",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "A memory location that holds a single letter or number.",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "What command do you use to output data to the screen?",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": 2,
  },
{
    "id": 5,
    "question":
        "It is very necessary to learn Dart language for building Flutter application?",
    "options": ['Yes', 'No', 'Can be yes or no', ' Can not say'],
    "answer_index": 1,
  },
  {
    "id": 6,
    "question": "Flutter developed by?.",
    "options": ['Oracle', 'Facebook', 'Google', ' IBM'],
    "answer_index": 3,
  },
  {
    "id": 7,
    "question": "Flutter is not a language; it is an SDK.",
    "options": ['TRUE', 'FALSE', ' Can be true or false', 'Can not say'],
    "answer_index": 1,
  },
  {
    "id": 8,
    "question": "The first alpha version of Flutter was released in ?",
    "options": ['2016', '2017', '2018', '2019'],
    "answer_index": 2,
  },
   {
    "id": 9,
    "question": "Flutter is mainly optimized for 2D mobile apps that can run on?",
    "options": ['Android', 'iOS', 'Both A and B', 'None of the above'],
    "answer_index": 3,
  },
  {
    "id": 10,
    "question":
        "FWhich programming language is used to build Flutter applications?_",
    "options": ['Kotlin', 'Dart', 'Java', 'Go'],
    "answer_index": 1,
  },
];
