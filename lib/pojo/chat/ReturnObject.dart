class ReturnObject {
  int id;
  String bodyID;
  String name;
  String data;
  String timee;
  String chat;
  int idtype;

  ReturnObject(
      {this.id,
        this.bodyID,
        this.name,
        this.data,
        this.timee,
        this.chat,
        this.idtype});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bodyID = json['bodyID'];
    name = json['name'];
    data = json['data'];
    timee = json['timee'];
    chat = json['chat'];
    idtype = json['idtype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bodyID'] = this.bodyID;
    data['name'] = this.name;
    data['data'] = this.data;
    data['timee'] = this.timee;
    data['chat'] = this.chat;
    data['idtype'] = this.idtype;
    return data;
  }

  @override
  String toString() {
    return 'ReturnObject{id: $id, bodyID: $bodyID, name: $name, data: $data, timee: $timee, chat: $chat, idtype: $idtype}';
  }



}