import 'package:flutter/material.dart';

void main() => runApp(PageFirst());

class PageFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page one'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PageTwo())),
          child: Text('下一页'),
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page two'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('返回'),
        ),
      ),
    );
  }
}