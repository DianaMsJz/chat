import 'dart:convert';

import 'package:chat/global/environment.dart';
import 'package:chat/models/login_response.dart';
import 'package:chat/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {
  Usuario? usuario;
  bool _autenticando = false;

  final _storage = new FlutterSecureStorage();
  //Getter para obtener el token
  static Future<String?> getToken() async {
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  //Set, eliminar el token desde otra pantalla que no sea logout
  static Future deleteToken() async {
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  bool get autenticando => this._autenticando;
  set autenticando(bool valor) {
    this._autenticando = valor;
    notifyListeners();
  }

  Future login(String email, String password) async {
    this.autenticando = true;
    //Payload que mandaremos al backend
    final data = {'email': email, 'password': password};
    final uri = Uri.parse('${Environment.apiUrl}/login/');
    final resp = await http.post(
      uri,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    this.autenticando = false;
    print(resp.body);

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      await this._guardarToken(loginResponse.token);
      //almacenamos el usuario autenticado
      this.usuario = loginResponse.usuario;
      return true;
    } else {
      return false;
    }
  }

  Future register(String nombre, String email, String password) async {
    this.autenticando = true;
    final data = {'nombre': nombre, 'email': email, 'password': password};
    final uri = Uri.parse('${Environment.apiUrl}/login/new');
    final resp = await http.post(
      uri,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    this.autenticando = false;
    print(resp.body);
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      await this._guardarToken(loginResponse.token);
      //almacenamos el usuario autenticado
      this.usuario = loginResponse.usuario;
      return true;
    } else {
      final respBody = jsonDecode(resp.body);
      return respBody['msg'];
    }
  }

  Future _guardarToken(String token) async {
    //Escribimos el valor del token
    return await _storage.write(key: 'token', value: token);
  }

  Future logout() async {
    //Eliminar token, desde la pantalla de cerrar sesión
    await _storage.delete(key: 'token');
  }
}
