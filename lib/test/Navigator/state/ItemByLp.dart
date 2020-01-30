

import 'package:flutter/material.dart';

class ShowPage extends StatelessWidget {
  String id = '';

  ShowPage({this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详细信息'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Text(
            "ID = ${this.id}"
        ),
      ),
    );
  }
}
