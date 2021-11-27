import 'package:chat/widgets/chat_message.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool _escribiendo = false;
  final _textCtrl = TextEditingController();
  final _focusNode = FocusNode();
  List<ChatMessage> _messages = [
    ChatMessage(
      texto:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec feugiat, urna eu finibus vehicula, est urna egestas mi, nec fringilla elit tortor quis libero',
      uid: '123',
    ),
    ChatMessage(
      texto:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec feugiat, urna eu finibus vehicula, est urna egestas mi, nec fringilla elit tortor quis libero',
      uid: '124',
    ),
    ChatMessage(
      texto:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec feugiat, urna eu finibus vehicula, est urna egestas mi, nec fringilla elit tortor quis libero',
      uid: '123',
    ),
    ChatMessage(
      texto:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec feugiat, urna eu finibus vehicula, est urna egestas mi, nec fringilla elit tortor quis libero',
      uid: '124',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(166, 92, 254, 1),
        title: Row(
          children: [
            CircleAvatar(
              child: Text('JC'),
            ),
            SizedBox(
              width: 30,
            ),
            Text('Jose Chavarria'),
          ],
        ),
      ),
      body: Container(
        color: Color.fromRGBO(194, 145, 254, 1),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                reverse: true,
                itemBuilder: (_, i) => _messages[i],
                physics: BouncingScrollPhysics(),
                itemCount: _messages.length,
              ),
            ),
            Divider(),
            Container(
              color: Color.fromRGBO(166, 92, 254, 1),
              child: _inputChat(),
            )
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textCtrl,
              onChanged: (texto) {
                setState(() {
                  texto.trim().length > 0
                      ? _escribiendo = true
                      : _escribiendo = false;
                });
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration.collapsed(
                hintText: 'Enviar',
                hintStyle: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          Container(
            child: IconTheme(
                data: IconThemeData(
                  color: Color.fromRGBO(60, 60, 60, 1),
                ),
                child: IconButton(
                    onPressed: _escribiendo
                        ? () => _handleSubmit(_textCtrl.text)
                        : null,
                    icon: Icon(Icons.send))),
          )
        ],
      ),
    );
  }

  _handleSubmit(String texto) {
    _focusNode.requestFocus();
    _textCtrl.clear();
    final newMessage = ChatMessage(texto: texto, uid: '123');
    _messages.insert(0, newMessage);
    _escribiendo = false;
    setState(() {});
  }
}
