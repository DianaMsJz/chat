import 'package:flutter/material.dart';

mostrarAlerta(BuildContext context, String titulo, String subtitulo) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(titulo),
      content: Text(subtitulo),
      actions: [
        MaterialButton(
          child: Text('Aceptar'),
          textColor: Colors.white,
          color: Color.fromRGBO(146, 184, 31, 1),
          onPressed: () => Navigator.pop(context),
        )
      ],
    ),
  );
}
