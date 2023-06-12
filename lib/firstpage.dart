import 'package:flutter/material.dart';
import 'package:to_do_list/secondpage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.add_task,
          color: Colors.black,
        ),
        title: Text(
          'Taskoo',
          style: TextStyle(
              fontFamily: 'Righteous',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.orange),
        ),
      ),
      body: Column(
        children: [
          Container(
            //for written items//
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Column(
              children: [
                Text(
                  'Manage Your \n Task  \n with',
                  style: TextStyle(fontSize: 50, letterSpacing: 2,fontFamily: 'Righteous'),
                ),
                Text(
                  'Taskoo',
                  style: TextStyle(
                      fontSize: 45,
                      fontFamily: 'Righteous',
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      decoration: TextDecoration.underline),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Image(
              // fit: BoxFit.fitWidth,
              image: AssetImage('assets/images/firstpage_bg.jpg'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:60),
            child: ElevatedButton(
              onPressed: () {
                //imp line///
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage()));

              },
              child: Text("Let's Start", style: TextStyle(fontSize: 20),),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 20),
                elevation: 7,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                backgroundColor: Colors.orangeAccent
              ),

            ),
          ),
        ],
      ),
    );
  }
}
