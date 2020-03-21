import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import './resultado.dart';

main() {
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'nota': 1},
        {'texto': 'Amarelo', 'nota': 3},
        {'texto': 'Verde', 'nota': 7},
        {'texto': 'Vermelho', 'nota': 10},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'nota': 8},
        {'texto': 'Gato', 'nota': 1},
        {'texto': 'Hipopótamo', 'nota': 9},
        {'texto': 'Sucuri', 'nota': 6}
      ]
    }
  ];

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Perguntas'),
      ),
      body: temPerguntaSelecionada
          ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              responder: _responder,
            )
          : Resultado(this._pontuacaoTotal, this._reiniciarQuestionario),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
