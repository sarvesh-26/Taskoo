import 'package:flutter/material.dart';
import 'todo.dart';
class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final OnToDoChanged;
  final OnDeleteItem;

  const ToDoItem({Key? key, required this.todo, required this.OnToDoChanged, required this.OnDeleteItem }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: ListTile(
        onTap: () {

          OnToDoChanged(todo);
          // print('click on list item');
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box:Icons.check_box_outline_blank,
          color: Colors.orange,
        ),
        title: Text(
          todo.todoText!,
          // 'tasks to be done',
          style: TextStyle(decoration: todo.isDone? TextDecoration.lineThrough:null),
        ),
        trailing: IconButton(
          onPressed: () {
            OnDeleteItem(todo.id);

            // print("clicked on delete button")

          },
          color: Colors.orange,
          icon: Icon(
            Icons.delete,
            color: Colors.orange,
          ),
        ),
      ),
    );
  }
}
