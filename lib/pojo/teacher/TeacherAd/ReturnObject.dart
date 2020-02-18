class ReturnObject {
  int id;
  String authorid;
  String datetime;
  String title;
  String content;

  ReturnObject(
      {this.id, this.authorid, this.datetime, this.title, this.content});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authorid = json['authorid'];
    datetime = json['datetime'];
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['authorid'] = this.authorid;
    data['datetime'] = this.datetime;
    data['title'] = this.title;
    data['content'] = this.content;
    return data;
  }
}