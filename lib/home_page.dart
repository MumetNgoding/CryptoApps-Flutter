// import 'dart:convert';
// import 'dart:async';
// import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {

  List currencies;
  HomePage(this.currencies);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List currencies;
  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  // @override
  // void initState() async {
  //   super.initState();
  //   currencies = await getCurrencies();
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Crypto Apps"),
      ),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return new Container(
      child: new Column(
        children: <Widget>[new Flexible(
          child: new ListView.builder(
            itemCount: widget.currencies.length,
            itemBuilder: (BuildContext context, int index) {
              final Map currency = widget.currencies[index];
              final MaterialColor color = _colors[index % _colors.length];

              return _getListItemUi(currency, color);
            },
          ),
        )],
      )
    );
  }
}


ListTile _getListItemUi(Map currency, MaterialColor color) {
  return new ListTile(
    leading: new CircleAvatar(
      backgroundColor: color,
      child: new Text(currency['name'][0]), //menampilkan nama crypto
    ),
    title: new Text(
      currency['name'],
      style: new TextStyle(fontWeight: FontWeight.bold),
    ),
    subtitle: _getSubtitleText(
        currency['price_idr'],
        currency[
            'percent_change_24h']), //menampilkan harga dan persentase harian
    isThreeLine: true,
  );
}

Widget _getSubtitleText(String priceUSD, String percentageChange) {
  TextSpan priceTextWidget = new TextSpan(
      text: "\IDR $priceUSD\n",
      style: new TextStyle(color: Colors.black)); //menampilkan harga

  String percentageChangeText = "24 Hour Percentage: $percentageChange%";
  TextSpan percentageChangeTextWidget;

  if (double.parse(percentageChange) > 0) {
    percentageChangeTextWidget = new TextSpan(
        text: percentageChangeText, style: new TextStyle(color: Colors.green));
  } else {
    percentageChangeTextWidget = new TextSpan(
        text: percentageChangeText, style: new TextStyle(color: Colors.red));
  }

  return new RichText(
    text: new TextSpan(children: [priceTextWidget, percentageChangeTextWidget]),
  );
}
