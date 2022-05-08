// ignore: file_names
import 'package:flutter/material.dart';
import 'package:quizapp/utils/themeData.dart';

class ToolBar extends StatelessWidget {
  const ToolBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 7, right: 12, top: 12),
      color: AppTheme.primaryColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage:
                    NetworkImage("http://placeimg.com/640/480/city"),
              ),
              const SizedBox(width: 12),
              Text(
                "Andres florez",
                style: AppTheme.textTheme.headline6,
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              Image.asset(
                "lib/assets/thopy.png",
                width: 40,
                height: 35,
              ),
              Text("30", style: AppTheme.textTheme.headline6),
            ],
          )
        ],
      ),
    );
  }
}
