import 'package:flutter/material.dart';

class TelaRespostas extends StatelessWidget {
  final List<Map<String, Object>> perguntas;

  const TelaRespostas({super.key, required this.perguntas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suas Respostas'),
        backgroundColor: Color(0xFFB56499),
      ),
      body: ListView.builder(
        itemCount: perguntas.length,
        itemBuilder: (context, index) {
          final pergunta = perguntas[index];
          return ListTile(
            title: Text(pergunta['text'] as String),
            subtitle: Text(
              'Sua resposta: ${pergunta['respostaUsuario'] ?? "Não respondida"}',
              ),
          );
        },
      ),
    );
  }
}
