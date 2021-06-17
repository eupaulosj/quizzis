import 'package:flutter/material.dart';
import 'questionario.dart';
import 'resultado.dart';


main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  final List perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': ['Preto', 'Branco', 'Vermelho', 'Azul'],
    },
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': ['Gato', 'Cachorro', 'Papagaio', 'Hamerti'],
    },
    {
      'texto': 'Qual seu jogador favorito?',
      'respostas': ['Neymar', 'Ronaldinho G.', 'CR7', 'Messi'],
    }
  ];

  bool get temPerguntaSelecionada => _perguntaSelecionada < perguntas.length;

  

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

 
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('PERGUNTAS')),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(),
      ),
    );
  }
}
