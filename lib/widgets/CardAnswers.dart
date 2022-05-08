import 'package:flutter/material.dart';
import 'package:quizapp/utils/getTheme.dart';
import 'package:quizapp/utils/utils.dart';

class CardAnswers extends StatefulWidget {
  final String answerText;
  final int index;
  final indexTap;
  // ignore: prefer_typing_uninitialized_variables
  final colorBackgroud;

  const CardAnswers(
      {Key? key,
      required this.answerText,
      required this.index,
      this.colorBackgroud = Colors.white,
      this.indexTap})
      : super(key: key);

  @override
  State<CardAnswers> createState() => _CardAnswersState();
}

class _CardAnswersState extends State<CardAnswers> {
  @override
  Widget build(BuildContext context) {
    final themeData = getTheme(context);

    List<String> answersLetter = ["A", "B", "C", "D"];

    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: widget.colorBackgroud,
      ),
      duration: const Duration(milliseconds: 300),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            child: Center(
              child: Text(answersLetter[widget.index],
                  style: themeData.textTheme.headline5
                      ?.copyWith(color: Colors.white)),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(widget.answerText,
              style: widget.index != widget.indexTap
                  ? AppTheme.textTheme.headline5
                      ?.copyWith(fontWeight: FontWeight.w400)
                  : themeData.textTheme.headline5
                      ?.copyWith(color: Colors.white)),
        ],
      ),
    );
  }
}
