class DisposePaperTableBean {
  int integer;

  DisposePaperTableBean({this.integer});

  DisposePaperTableBean.fromJson(Map<String, dynamic> json) {
    integer = json['integer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['integer'] = this.integer;
    return data;
  }
}