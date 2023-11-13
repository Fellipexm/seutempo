
|import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(HelloWorldApp());
}

class HelloWorldApp extends StatefulWidget {
  @override
  _HelloWorldAppState createState() => _HelloWorldAppState();
}

class _HelloWorldAppState extends State<HelloWorldApp> {
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        currentPageIndex = (currentPageIndex + 1) % 3; // Alterna entre as três telas a cada 5 segundos
      });
    });

    Timer(Duration(seconds: currentPageIndex == 2 ? 30 : 0), () {
      setState(() {
        currentPageIndex = (currentPageIndex + 1) % 3; // Após 30 segundos na tela amarela, passa para a próxima tela
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Color> backgroundColors = [Colors.green, Colors.red, Colors.yellow];
    List<Color> titleBackgroundColors = [Colors.blue, Colors.purple, Colors.orange];
    List<String> messages = [
      'Somos capazes de fazer muito mais do que imaginamos!',
      'A palavra “impossível” foi inventada para ser desafiada.',
      'Cada minuto dedicado ao aprendizado e crescimento pessoal é um passo na direção dos seus sonhos. Então que tal aproveitar cada momento para construir um futuro incrível?'
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColors[currentPageIndex], // Altera entre as cores de fundo
        appBar: AppBar(
          title: Center(
            child: Text(
              'Motivação no estudo',
              style: TextStyle(
                backgroundColor: titleBackgroundColors[currentPageIndex], // Altera a cor de fundo do título
              ),
            ),
          ),
        ),
        body: Center(
          child: Text(
            messages[currentPageIndex],
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
