class ReturnApplicationPaperNotPassBean {
  String whatYourDo;
  int number;
  bool key;
  Null returnObject;
  String why;

  ReturnApplicationPaperNotPassBean(
      {this.whatYourDo, this.number, this.key, this.returnObject, this.why});

  ReturnApplicationPaperNotPassBean.fromJson(Map<String, dynamic> json) {
    whatYourDo = json['whatYourDo'];
    number = json['number'];
    key = json['key'];
    returnObject = json['returnObject'];
    why = json['why'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['whatYourDo'] = this.whatYourDo;
    data['number'] = this.number;
    data['key'] = this.key;
    data['returnObject'] = this.returnObject;
    data['why'] = this.why;
    return data;
  }

  @override
  String toString() {
    return 'ReturnApplicationPaperNotPassBean{whatYourDo: $whatYourDo, number: $number, key: $key, returnObject: $returnObject, why: $why}';
  }


}