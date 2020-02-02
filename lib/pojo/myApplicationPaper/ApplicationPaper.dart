

import 'package:application_paper/pojo/myApplicationPaper/ReturnApplicationPaperBean.dart';
import 'package:application_paper/pojo/myApplicationPaper/StudentApplicationPaperBean.dart';
import 'package:dio/dio.dart';

void main() {
  ApplicationPaper applicationPaper = new ApplicationPaper(studentApplicationPaperBean: StudentApplicationPaperBean(string: "1667159125"));

  return null;
}

class ApplicationPaper {

  // 参数
  StudentApplicationPaperBean studentApplicationPaperBean;

  // 返回值
  ReturnApplicationPaperBean returnApplicationPaperBean;

  ApplicationPaper({this.studentApplicationPaperBean}) {
    // 初始化。获取用户ID
    this.initState();
    // 获取网络数据
    this.postHttp();
  }

  void initState() {
    // this._readCounter();
  }

  void postHttp() async {
    try{
      var response = await Dio().post(
        'http://123.56.167.84:8080/selection_of_college_graduation_design-0.0.1-SNAPSHOT/applicationPaper/getStudentAll',
        data: this.studentApplicationPaperBean.toJson(),
      );
      print(response);
      returnApplicationPaperBean = ReturnApplicationPaperBean.fromJson(response.data);
      print(returnApplicationPaperBean);
    }catch(e){
      returnApplicationPaperBean = null;
    }
  }

  /*// _getLocalFile函数，获取本地文件目录
  Future<File> _getLocalFile() async {
    // 获取本地文档目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    print(dir);
    // 返回本地文件目录
    return new File('$dir/userInformation.txt');
  }

  void _readCounter() async {
    try {
      *//*
       * 获取本地文件目录
       * 关键字await表示等待操作完成
       *//*
      File file = await _getLocalFile();
      // 从文件中读取变量作为字符串，一次全部读完存在内存里面
      var contents = await file.readAsString();
      print(contents);
      var jsonMap = await json.decode(contents);
      userInformation = UserInformation.fromJson(jsonMap);
    } on FileSystemException {
    }
  }*/

}


