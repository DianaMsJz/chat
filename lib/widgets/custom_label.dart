import 'package:flutter/material.dart';

class CustomLabels extends StatelessWidget {
  final String texto;
  final Color color;
  final String ruta;
  const CustomLabels(
      {Key? key, required this.texto, required this.color, required this.ruta})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            child: Text(
              texto,
              style: TextStyle(
                  color: color, fontSize: 20, fontWeight: FontWeight.w700),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, ruta);
            },
          ),
        ],
      ),
    );
  }
}
