import 'package:flutter/material.dart';
import 'package:projeto_perguntas/respostas.dart';
import './questao.dart';
import 'botao.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: PerguntaApp());
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  List<Map<String, Object>> perguntas = [
    {
      'text': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Rosa', 'Verde', 'Amarelo'],
      'respostaUsuario': '',
    },
    {
      'text': 'Qual é o seu animal favorito?',
      'respostas': ['Gato', 'Leão', 'Cobra', 'Elefante'],
      'respostaUsuario': '',
    },
    {
      'text': 'Qual é a melhor fase do seu namorado?',
      'respostas': ['Feliz', 'Triste', 'Bravo', 'Todas'],
      'respostaUsuario': '',
    },
  ];

  void _responder(String resposta) {
    setState(() {
      perguntas[_perguntaSelecionada]['respostaUsuario'] = resposta;
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
                        'Você Respondeu Tudo, MEU DEUS <3',
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
                                      TelaRespostas(perguntas: perguntas),
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
                            as List<String>)
                        .map((resposta) {
                          return MeuBotao(
                            titulo: resposta,
                            onPressed: () {
                              _responder(resposta);
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
