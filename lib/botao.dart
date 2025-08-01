import 'package:flutter/material.dart';

class MeuBotao extends StatelessWidget {
  final String titulo;
  final VoidCallback onPressed;
  final ButtonStyle? style;
  final Color? color;
  final double largura;

  const MeuBotao({
    super.key,
    required this.titulo,
    required this.onPressed,
    this.style,
    this.color,
    required this.largura,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 150),
      width: largura,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(28, 153, 132, 145),
          foregroundColor: Colors.white,
        ),
        child: Text(
          titulo,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }
}
