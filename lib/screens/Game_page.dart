// ignore: file_names
import 'package:flutter/material.dart';
import 'package:quizapp/models/models.dart';
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
                child: const ContentModalStart(),
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

              return SizedBox(
                height: height - 450,
                width: width,
                child: Column(
                  children: [
                    Image.asset(
                      "lib/assets/lose.gif",
                      height: 300.0,
                      width: 300.0,
                    ),
                    Text(
                      title,
                      style: AppTheme.textTheme.headline5,
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
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
    Future.delayed(const Duration(seconds: 5));
    showModalRespoonse(
        imageURL:
            'https://images.cults3d.com/gNmCucguF_950khaXUHO3dVUZLM=/516x516/https://files.cults3d.com/uploaders/19933232/illustration-file/58d154fb-ebc1-4f8b-bd76-a53f7c5c1ef5/2022_01_17_00_12_48_Pok%C3%A9ball_normal.pdf_et_1_page_suppl%C3%A9mentaire_Personnel_Microsoft_Edge.png',
        title: 'Respuesta incorrecta');
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
          decoration:
              const BoxDecoration(gradient: AppTheme.gradientBackground),
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
}
