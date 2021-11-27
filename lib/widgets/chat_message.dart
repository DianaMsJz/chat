import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String texto;
  final String uid;
  const ChatMessage({
    Key? key,
    required this.texto,
    required this.uid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.uid == '123' ? _myMessage() : _otherMessage(),
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(9),
        margin: EdgeInsets.only(bottom: 6, left: 50, right: 6),
        child: Text(
          this.texto,
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
            color: Color.fromRGBO(12, 134, 208, 1),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget _otherMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(9),
        margin: EdgeInsets.only(bottom: 6, left: 6, right: 50),
        child: Text(
          this.texto,
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
            color: Color.fromRGBO(120, 202, 252, 1),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
