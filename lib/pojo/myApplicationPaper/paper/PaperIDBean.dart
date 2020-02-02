class PaperIDBean {
  String integer;

  PaperIDBean({this.integer});

  PaperIDBean.fromJson(Map<String, dynamic> json) {
    integer = json['integer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['integer'] = this.integer;
    return data;
  }

  @override
  String toString() {
    return 'PaperIDBean{integer: $integer}';
  }

}