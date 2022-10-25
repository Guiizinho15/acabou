// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:quiz/perguntasBuild.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/HomeBackground.png"),
              fit: BoxFit.fill),
        ),
        child: Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 10, 63, 60)),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const QuizPage()));
              },
              child: const Text("Começar!")),
        ),
      ),
    );
  }
}
