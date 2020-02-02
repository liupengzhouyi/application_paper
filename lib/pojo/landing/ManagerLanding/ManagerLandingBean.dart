class ManagersLandingBean {
  int id;
  String managerid;
  String passwordvalue;

  ManagersLandingBean({this.id, this.managerid, this.passwordvalue});

  ManagersLandingBean.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    managerid = json['managerid'];
    passwordvalue = json['passwordvalue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['managerid'] = this.managerid;
    data['passwordvalue'] = this.passwordvalue;
    return data;
  }

  @override
  String toString() {
    return 'ManagersLandingBean{id: $id, managerid: $managerid, passwordvalue: $passwordvalue}';
  }

}