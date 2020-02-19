class GroupBean {
  int integer;

  GroupBean({this.integer});

  GroupBean.fromJson(Map<String, dynamic> json) {
    integer = json['integer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['integer'] = this.integer;
    return data;
  }

  @override
  String toString() {
    return 'GroupBean{integer: $integer}';
  }

}