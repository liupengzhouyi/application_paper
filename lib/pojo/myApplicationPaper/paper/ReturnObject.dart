// 论文信息
class ReturnObject {
  int id;
  String papername;
  String teacherid;
  String releasedate;
  String url;
  int isselect;

  ReturnObject(
      {this.id,
        this.papername,
        this.teacherid,
        this.releasedate,
        this.url,
        this.isselect});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    papername = json['papername'];
    teacherid = json['teacherid'];
    releasedate = json['releasedate'];
    url = json['url'];
    isselect = json['isselect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['papername'] = this.papername;
    data['teacherid'] = this.teacherid;
    data['releasedate'] = this.releasedate;
    data['url'] = this.url;
    data['isselect'] = this.isselect;
    return data;
  }
}