class ChatBean {
  String bodyid;
  String chat;
  String date;
  int groupid;
  int id;
  int idtype;
  String time;

  ChatBean(
      {this.bodyid,
        this.chat,
        this.date,
        this.groupid,
        this.id,
        this.idtype,
        this.time});

  ChatBean.fromJson(Map<String, dynamic> json) {
    bodyid = json['bodyid'];
    chat = json['chat'];
    date = json['date'];
    groupid = json['groupid'];
    id = json['id'];
    idtype = json['idtype'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bodyid'] = this.bodyid;
    data['chat'] = this.chat;
    data['date'] = this.date;
    data['groupid'] = this.groupid;
    data['id'] = this.id;
    data['idtype'] = this.idtype;
    data['time'] = this.time;
    return data;
  }

  @override
  String toString() {
    return 'ChatBean{bodyid: $bodyid, chat: $chat, date: $date, groupid: $groupid, id: $id, idtype: $idtype, time: $time}';
  }


}