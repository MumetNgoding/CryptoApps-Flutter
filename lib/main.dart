import 'package:flutter/material.dart';
import 'dart:async';
import 'home_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async { 
  List currencies = await getCurrencies();
  print(currencies);
  runApp(new MyApp(currencies)); 
  }

class MyApp extends StatelessWidget {

  final List _currencies;
  MyApp(this._currencies);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.pink
      ),
      home: new HomePage(_currencies),
    );
  }
}

Future<List> getCurrencies() async {
    String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50&convert=IDR";
    http.Response response = await http.get(cryptoUrl);
    return jsonDecode(response.body);
  }