import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class botton_screen extends StatefulWidget {
  const botton_screen({Key? key}) : super(key: key);

  @override
  State<botton_screen> createState() => _botton_screenState();
}

class _botton_screenState extends State<botton_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: Column(
          children: [
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context,'pattern');
          }, child: Text("Pattern")),
            SizedBox(height: 40),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, 'Api_screen');
            }, child: Text("Api")),
            SizedBox(height: 40),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, 'Todo');
            }, child: Text("Todo")),


          ],
        ),
      ),
    ),
    );
  }
}
