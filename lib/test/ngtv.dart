
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageFirst(),
    );
  }
}

class PageFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page one'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () async {
                // 跳转到 page two，等待返回结果
                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageTwo(
                      text: '我是来自p1的参数',
                    ),
                  ),
                );
                // 输出 page two 返回来的结果
                print(result);
              },
              child: Text('下一页：传参数'),
            ),
          ],
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  final String text;

  const PageTwo({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page two'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text != null ? text : ''),
            RaisedButton(
              onPressed: () => Navigator.pop(context, '我是来自p2的返回值'),
              child: Text('返回'),
            ),
          ],
        ),
      ),
    );
  }
}

