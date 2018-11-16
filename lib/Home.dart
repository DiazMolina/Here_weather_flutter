import 'package:flutter/material.dart';
import 'package:here_weather_flutter/list_data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Here Weather Lima"),
      ),
      body: new MediaList(),




    );
  }
}
