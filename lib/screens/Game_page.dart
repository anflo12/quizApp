// ignore: file_names
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:quizapp/models/models.dart';
import 'package:quizapp/utils/getTheme.dart';
import 'package:quizapp/utils/themeData.dart';
import 'package:quizapp/widgets/widgets.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  /*   {
      "category": "Conocimientos generales",
      "type": "múltiple",
      "difficulty": "fácil",
      "question": "¿Quién está representado en el billete de cien dólares estadounidenses?",
      "correct_answer": "Benjamin Franklin",
      "incorrect_answers": [
        "george washington",
        "Abraham Lincoln",
        "Thomas Jefferson"
      ]
    }, */
  final List<AnswersModel> questionsList = [
    AnswersModel(
        category: "Conocimientos generales",
        type: "múltiple",
        difficulty: "fácil",
        question:
            "¿Quién está representado en el billete de cien dólares estadounidenses?",
        correctAnswer: "Benjamin Franklin",
        incorrectAnswers: [
          "george washington",
          "Abraham Lincoln",
          "Thomas Jefferson"
        ])
  ];

  var onPressResponse = false;
  Color? colorBackground;
  int? indexTap;
  var disabled = true;

  String getAnswer(int index) {
    final correctAnswer = questionsList[0].correctAnswer;
    final answersList = [...questionsList[0].incorrectAnswers, correctAnswer];
    final answer = answersList[index];
    return answer;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 12),
          content: Builder(
            builder: (context) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.
              var height = MediaQuery.of(context).size.height;
              var width = MediaQuery.of(context).size.width;

              return SizedBox(
                height: height - 350,
                width: width,
                child: contentModal(context),
              );
            },
          ),
        ),
      );
    });
  }

  void showModalRespoonse({imageURL, title}) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Expanded(
        child: AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 12),
          content: Builder(
            builder: (context) {
              var height = MediaQuery.of(context).size.height;
              var width = MediaQuery.of(context).size.width;

              return Card(
                child: Column(
                  children: [
                    Text(
                      title,
                      style: AppTheme.textTheme.headline6,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void validateAnswer(int index, String selectAnswer) {
    if (questionsList[0].correctAnswer == selectAnswer) {
      setState(() {
        onPressResponse = true;
        colorBackground = Colors.greenAccent[700];
        indexTap = index;
      });
      return;
    }

    setState(() {
      onPressResponse = true;
      colorBackground = Colors.red[700];
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 90,
          flexibleSpace: const ToolBar(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(gradient: AppTheme.gradientBackground),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: Text(
                  questionsList[0].question,
                  style: AppTheme.textTheme.headline6
                      ?.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: questionsList[0].incorrectAnswers.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          InkWell(
                            key: Key("$index"),
                            onTap: () => {
                              if (indexTap == null)
                                {validateAnswer(index, getAnswer(index))}
                            },
                            child: CardAnswers(
                                answerText: getAnswer(index),
                                index: index,
                                indexTap: indexTap,
                                colorBackgroud: indexTap == index
                                    ? colorBackground
                                    : Colors.white),
                          )
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget contentModal(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 45),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selecciona una dificultad",
                  style: AppTheme.textTheme.headline6
                      ?.copyWith(color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.only(left: 12, right: 12),
                          backgroundColor: AppTheme.primaryColor),
                      onPressed: null,
                      child: Text(
                        "Facíl",
                        style: AppTheme.textTheme.bodyText2,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: AppTheme.primaryColor),
                      onPressed: null,
                      child: Text(
                        "Medio",
                        style: AppTheme.textTheme.bodyText2,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: AppTheme.primaryColor),
                      onPressed: null,
                      child: Text(
                        "Pro",
                        style: AppTheme.textTheme.bodyText2,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selecciona una categoria",
                  style: AppTheme.textTheme.headline6
                      ?.copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 12,
                ),
                TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(fontSize: 14, color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Busca o selecciona una categoria",
                      hintStyle: TextStyle(color: Colors.white),
                      fillColor: AppTheme.primaryColor,
                      filled: true,
                    ),
                  ),
                  suggestionsCallback: (pattern) {
                    return ["oki", "oki2"].toList();
                  },
                  suggestionsBoxDecoration: const SuggestionsBoxDecoration(
                    shadowColor: Color.fromARGB(34, 173, 151, 229),
                    color: Colors.white,
                  ),
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(
                        suggestion.toString(),
                        style: AppTheme.textTheme.headline6
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                    );
                  },
                  onSuggestionSelected: (suggestion) {},
                ),
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: 300,
                    decoration: const BoxDecoration(
                        gradient: AppTheme.gradientBackground),
                    child: TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Center(
                        child: Text(
                          "A jugar",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
