import 'package:flutter/material.dart';
import 'package:projeto_perguntas/respostas.dart';
import './questao.dart';
import 'botao.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: PerguntaApp());
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  int _totalNotas = 0;

  List<Map<String, Object>> perguntas = [
    {
      'text': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'nota': 10},
        {'texto': 'Rosa', 'nota': 9},
        {'texto': 'Verde', 'nota': 8},
        {'texto': 'Amarelo', 'nota': 2},
      ],
      'respostaUsuario': '',
    },
    {
      'text': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Gato', 'nota': 10},
        {'texto': 'Leão', 'nota': 5},
        {'texto': 'Cobra', 'nota': 2},
        {'texto': 'Elefante', 'nota': 9},
      ],
      'respostaUsuario': '',
    },
    {
      'text': 'Qual seu sentimento no momento?',
      'respostas': [
        {'texto': 'Feliz', 'nota': 10},
        {'texto': 'Triste', 'nota': 1},
        {'texto': 'Bravo', 'nota': 5},
        {'texto': 'Todas', 'nota': 10},
      ],
      'respostaUsuario': '',
    },
  ];

  void _responder(String resposta, int nota) {
    setState(() {
      perguntas[_perguntaSelecionada]['respostaUsuario'] = resposta;
      _totalNotas += nota;
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFFFffa),
        appBar: AppBar(
          backgroundColor: Color(0xFFB56499),
          title: Text('Questionário da Mimi'),
          foregroundColor: Colors.white,
        ),
        body:
            _perguntaSelecionada >= perguntas.length
                ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Parabéns! Você respondeu tudo.',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      TelaRespostas(perguntas: perguntas, 
                                      totalNotas: _totalNotas),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFB56499),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                        child: Text(
                          'Respostas',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _perguntaSelecionada = 0;
                            for (var pergunta in perguntas) {
                              pergunta['respostaUsuario'] = '';
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFB56499),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                        child: Text(
                          'Refazer Questionário',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Questao(perguntas[_perguntaSelecionada]['text'].toString()),
                    ...(perguntas[_perguntaSelecionada]['respostas']
                            as List<Map>)
                        .map((resposta) {
                          return MeuBotao(
                            titulo: resposta['texto'] as String,
                            onPressed: () {
                              _responder(
                                resposta['texto'] as String,
                                resposta['nota'] as int,
                              );
                            },
                            color: Color.fromARGB(28, 153, 132, 145),
                            largura: double.infinity,
                            style: ElevatedButton.styleFrom(),
                          );
                        })
                        .toList(),
                  ],
                ),
      ),
    );
  }
}
