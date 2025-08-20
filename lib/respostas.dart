import 'package:flutter/material.dart';

class TelaRespostas extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int totalNotas;

  const TelaRespostas({
    super.key,
    required this.perguntas,
    required this.totalNotas,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suas Respostas'),
        backgroundColor: Color(0xFFB56499),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Sua Pontuação total foi $totalNotas',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
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
          ),
        ],
      ),
    );
  }
}
