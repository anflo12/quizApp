import 'package:flutter/material.dart';
import 'package:quizapp/utils/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        toolbarHeight: 35,
        elevation: 0,
        title: Text(
          "QUIZZ APP",
          style: AppTheme.textTheme.headline4,
        ),
      ),
      body: Container(
          decoration: const BoxDecoration(
            gradient: AppTheme.gradientBackground,
          ),
          child: const ButtonStart()),
    );
  }
}

class ButtonStart extends StatelessWidget {
  const ButtonStart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(300),
                color: Colors.white,
              )),
          Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(300),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppTheme.primaryColor,
                  AppTheme.gradientColor2,
                ],
              ),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(300)),
              ),
              child: const Text(
                "Iniciar",
                style: TextStyle(fontSize: 38, color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/game");
              },
            ),
          ),
        ],
      ),
    );
  }
}
