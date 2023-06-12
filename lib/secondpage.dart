import 'package:flutter/material.dart';
import 'todo.dart';
import 'todo_item.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final todosList = ToDo.todoList();
  List<ToDo> foundTodo = [];
  final _todocontroller = TextEditingController();

  @override
  void initState() {
    foundTodo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF5),
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.add_task,
          color: Colors.black,
        ),
        title: Text(
          'Hi Sarvesh',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontFamily: 'Righteous'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile_avatar.png'),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(30),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),
                    child: TextField(
                      onChanged: (value) => runfilter(value),
                      // controller: _todocontroller,
                      decoration: InputDecoration(
                        hintText: '                  search your notes here',
                        contentPadding: EdgeInsets.all(5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ),
                ), //for search bar
                Container(
                  margin: EdgeInsets.only(right: 100),
                  child: Text(
                    "Your todos",
                    style: TextStyle(fontSize: 50, fontFamily: 'Righteous'),
                  ),
                ), //for
                //using for loop to accessing list items defined in seprate dart file
                for (ToDo x in foundTodo.reversed)
                  ToDoItem(
                    todo: x,
                    OnToDoChanged: todochange,
                    OnDeleteItem: deleteTodoItem,
                  )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 40, bottom: 5, right: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [BoxShadow(blurRadius: 5)]),
                  child: SizedBox(
                    width: 250,
                    child: TextField(
                      controller: _todocontroller,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Add new task to be done',
                          contentPadding: EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    addTodoItem(_todocontroller.text);
                  },
                  backgroundColor: Colors.orange,
                  child: Icon(
                    Icons.add,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void todochange(ToDo toDo) {
    setState(() {
      toDo.isDone = !toDo.isDone;
    });
  }

  void deleteTodoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void addTodoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
      });
    _todocontroller.clear();
  }

  void runfilter(String enteredkeyword) {
    List<ToDo> results = [];
    if (enteredkeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredkeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundTodo = results;
    });
  }
}
