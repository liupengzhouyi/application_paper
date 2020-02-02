class UserInformation {
  String userType = "-1";
  String id = "";
  String password = "";
  String landing = "0";
  String registered = "0";


  UserInformation(
      {this.userType, this.id, this.password, this.landing, this.registered});

  UserInformation.fromJson(Map<String, dynamic> json) {
    userType = json['userType'];
    id = json['id'];
    password = json['password'];
    landing = json['landing'];
    registered = json['registered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userType'] = this.userType;
    data['id'] = this.id;
    data['password'] = this.password;
    data['landing'] = this.landing;
    data['registered'] = this.registered;
    return data;
  }

  @override
  String toString() {
    return '{"userType": "$userType", "id": "$id", "password": "$password", "landing": "$landing", "registered": "$registered"}';
  }

}