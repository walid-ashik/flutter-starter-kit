import 'dart:convert';

List<Todo> rpTodoFromJson(String str) => List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

String rpTodoToJson(List<Todo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Todo {
  int? _userId;
  int? _id;
  String? _title;
  bool? _completed;

  int? get userId => _userId;
  int? get id => _id;
  String? get title => _title;
  bool? get completed => _completed;

  Todo({
      int? userId, 
      int? id, 
      String? title, 
      bool? completed}){
    _userId = userId;
    _id = id;
    _title = title;
    _completed = completed;
}

  Todo.fromJson(dynamic json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
    _completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['userId'] = _userId;
    map['id'] = _id;
    map['title'] = _title;
    map['completed'] = _completed;
    return map;
  }
}