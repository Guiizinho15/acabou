// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, avoid_print, non_constant_identifier_names, deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:quiz/endScreen.dart';
import 'package:quiz/perguntas.dart';
import 'package:video_player/video_player.dart';

import 'chewie_item.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late PageController _controller;
  bool lock = false;

  bool videoPlaying = false;
  late String url = "videos/1.mp4";

  int group = 4;
  int pagecount = 1;
  int acertos = 0;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/QuizBackground.png"),
              fit: BoxFit.fill),
        ),
        child: Center(
          child: Card(
            color: Colors.white38,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 700, minHeight: 400),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: PageView.builder(
                  controller: _controller,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: perguntas.length,
                  itemBuilder: (context, index) {
                    final _pergunta = perguntas[index];
                    return builPergunta(_pergunta);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget builPergunta(_pergunta) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Pergunta(_pergunta['pergunta']),
        Container(
          decoration: BoxDecoration(
              color: !lock
                  ? const Color.fromARGB(221, 255, 255, 255)
                  : _pergunta['respostas'][0]['correta']
                      ? Colors.green
                      : Colors.red,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Radio(
                value: 0,
                groupValue: group,
                onChanged: (value) {
                  setState(() {
                    if (!lock) {
                      group = value ?? 0;
                    }
                  });
                },
              ),
              Flexible(child: Text(_pergunta['respostas'][0]['resposta']))
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: !lock
                  ? const Color.fromARGB(221, 255, 255, 255)
                  : _pergunta['respostas'][1]['correta']
                      ? Colors.green
                      : Colors.red,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Radio(
                value: 1,
                groupValue: group,
                onChanged: (value) {
                  setState(() {
                    if (!lock) {
                      group = value ?? 0;
                    }
                  });
                },
              ),
              Flexible(child: Text(_pergunta['respostas'][1]['resposta']))
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: !lock
                  ? const Color.fromARGB(221, 255, 255, 255)
                  : _pergunta['respostas'][2]['correta']
                      ? Colors.green
                      : Colors.red,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Radio(
                value: 2,
                groupValue: group,
                onChanged: (value) {
                  setState(() {
                    if (!lock) {
                      group = value ?? 0;
                    }
                  });
                },
              ),
              Flexible(child: Text(_pergunta['respostas'][2]['resposta']))
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: !lock
                  ? const Color.fromARGB(221, 255, 255, 255)
                  : _pergunta['respostas'][3]['correta']
                      ? Colors.green
                      : Colors.red,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Radio(
                value: 3,
                groupValue: group,
                onChanged: (value) {
                  setState(() {
                    if (!lock) {
                      group = value ?? 0;
                    }
                  });
                },
              ),
              Flexible(child: Text(_pergunta['respostas'][3]['resposta']))
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 10, 63, 60)),
          onPressed: () async {
            if (group != 4) {
              if (lock) {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChewieListItem(
                        looping: false,
                        videoPlayerController:
                            VideoPlayerController.asset(_pergunta['url'])),
                  ),
                );
                if (_pergunta['respostas'][group]['correta']) {
                  acertos++;
                }
                group = 4;
                lock = false;
                if (pagecount >= perguntas.length) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EndScreen(
                        acertos: acertos,
                      ),
                    ),
                  );
                }
                _controller.nextPage(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInExpo);
                pagecount++;
              } else {
                setState(() {
                  lock = true;
                });
              }
            }
          },
          child: lock ? const Text('Prosseguir') : const Text('Responder'),
        ),
      ],
    );
  }

  Widget Pergunta(pergunta) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(221, 255, 255, 255),
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          pergunta,
        ),
      ),
    );
  }
}
