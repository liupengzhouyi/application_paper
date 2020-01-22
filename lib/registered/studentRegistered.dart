
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              "flutter Demo",
          ),
        ),
        body: Center(
          child: Container(
            child: Text(
                "xxxxdecoration: BoxDecoratid"
                    "ecoration: BoxDecoratidecoration"
                    ": BoxDecoratideco"
                    "decoration: BoxDecorati"
                    "ration: BoxDecoratidecoration: BoxDecorati",
                textAlign: TextAlign.left,
                // 超出设置
                overflow: TextOverflow.fade,
                // 最大显示行数
                maxLines: 10,
                textScaleFactor: 1,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.w200,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.black87,
                  decorationStyle: TextDecorationStyle.solid,
                ),
            ),
            height: 300.00,
            width: 300.00,
            decoration: BoxDecoration(
                color: Colors.amberAccent,
                border: Border.all(
                  color: Colors.black,
                  width: 2.00,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
            ),
            // 内容到边框的距离
            //padding: EdgeInsets.all(20),
            padding: EdgeInsets.fromLTRB(10, 30, 10, 20)
          ),
        ),
      ),
    );
  }
}