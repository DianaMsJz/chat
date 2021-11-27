import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  final String texto;
  const CustomLogo({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Image(image: AssetImage('assets/logo.png')),
            SizedBox(
              height: 20,
            ),
            Text(
              texto,
              style: TextStyle(fontSize: 35, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
