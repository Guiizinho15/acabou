// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:quiz/homePage.dart';

class EndScreen extends StatefulWidget {
  const EndScreen({super.key, required this.acertos});
  final int acertos;

  @override
  State<EndScreen> createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/assets/HomeBackground.png"),
                fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 100000,
              ),
              Text(
                'Você acertou ${widget.acertos} de 2 perguntas!',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 10, 63, 60)),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: const Text('voltar'))
            ],
          ),
        ),
      ),
    );
  }
}
