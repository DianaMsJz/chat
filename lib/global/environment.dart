import 'dart:io';

class Environment {
  //para conectar con el backend
  static String apiUrl = Platform.isAndroid
      ? 'http://192.168.56.1:3000/api'
      : 'http://localhost:3000/api';
  //para usar los sockets
  static String socketUrl =
      Platform.isAndroid ? 'http://192.168.56.1:3000' : 'http://localhost:3000';
}
