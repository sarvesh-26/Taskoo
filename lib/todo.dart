import 'package:flutter/material.dart';

class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false, //by default false //
  });

  static List<ToDo> todoList(){
    return
        [
          ToDo(id: '1', todoText: 'Morning breakfast', isDone: true),
          ToDo(id: '2', todoText: ' breakfast', isDone: true),
          ToDo(id: '3', todoText: 'lunch', isDone: false),
          ToDo(id: '4', todoText: 'after lunch', isDone: true),
        ];
  }

}
