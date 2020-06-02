class NewModel{
    String body;
    String head;
    String id;

    NewModel(this.body, this.head, this.id);

    NewModel.fromJson(Map<String, dynamic> json) : body = json["body"], head = json["head"], id = json["id"];    
}