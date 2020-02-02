
import 'dart:convert';
import 'dart:io';

import 'package:application_paper/pojo/userInformation.dart';
import 'package:path_provider/path_provider.dart';

class GetLocdeInformationByLP {

  UserInformation userInformation;

  GetLocdeInformationByLP() {
    this.readCounter();
  }

  // _getLocalFile函数，获取本地文件目录
  Future<File> _getLocalFile() async {
    // 获取本地文档目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    // print(dir);
    // 返回本地文件目录
    return new File('$dir/userInformation.txt');
  }

  void readCounter() async {
    try {
      File file = await _getLocalFile();
      // 从文件中读取变量作为字符串，一次全部读完存在内存里面
      var contents = await file.readAsString();
      var jsonMap = await json.decode(contents);
      this.userInformation = UserInformation.fromJson(jsonMap);
      print(userInformation);
    } on FileSystemException {
    }
  }

}