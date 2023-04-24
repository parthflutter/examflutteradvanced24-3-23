import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/to_do_provider.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {

  ToListProvider? True,False;
  @override
  Widget build(BuildContext context) {
    True = Provider.of<ToListProvider>(context,listen: true);
    False = Provider.of<ToListProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {
              showDialog(context: context, builder: (context) {
                return SimpleDialog(
                  contentPadding: EdgeInsets.all(10),
                  children: [
                    TextField(
                      controller: True!.txtnameadd,
                      decoration: InputDecoration(
                        hintText: "Enter Name Add",
                      ),
                    ),
                    TextField(
                      controller: True!.txtorderadd,
                      decoration: InputDecoration(
                        hintText: "Enter Order Add",
                      ),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: () {
                      String title = True!.txtnameadd.text;
                      String task = True!.txtorderadd.text;
                      True!.todotask.add(task);
                      True!.todotitle.add(title);
                      Navigator.pop(context);
                      False!.refresh();
                    }, child: Text("Save",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),))
                  ],
                );
              },);
            }, icon: Icon(Icons.add))
          ],
          title: Text("To Do Screen"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Orders",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
              Container(
                width: double.infinity,
                height: 500,
                child: ListView.builder(itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    height: 60,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("   ${True!.todotitle[index]}"),
                            Text("   ${True!.todotask[index]}",style: TextStyle(fontSize: 20),),
                          ],
                        ),
                        Spacer(),
                        Container(
                          height: 60,
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  if(True!.doneCheck == true) {
                                    True!.done.add(True!.todotask[index]);
                                    False!.refresh();
                                  }
                                  False!.doneCheck = false;
                                },
                                child: Container(
                                  height: 80,
                                  width: 25,
                                  child: Icon(Icons.near_me),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(context: context, builder: (context) {
                                    return SimpleDialog(
                                      children: [
                                        Container(
                                          margin:EdgeInsets.all(10) ,
                                          child: TextField(
                                            controller: True!.txtupdatedname,
                                            decoration: InputDecoration(
                                                hintText: "Update Name"
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin:EdgeInsets.all(10) ,
                                          child: TextField(
                                            controller: True!.txtupdatedorder,
                                            decoration: InputDecoration(
                                                hintText: "Update Order"
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        ElevatedButton(onPressed: () {
                                          String name = True!.txtupdatedname.text;
                                          String order = True!.txtupdatedorder.text;
                                          True!.todotitle[index] = name;
                                          True!.todotask[index] = order;
                                          Navigator.pop(context);
                                          False!.refresh();
                                        }, child: Text("Save Changes",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black))),
                                      ],
                                    );
                                  },);
                                },
                                child: Container(
                                  height: 80,
                                  width: 25,
                                  child: Icon(Icons.edit),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  True!.todotitle.removeAt(index);
                                  True!.todotask.removeAt(index);
                                  False!.refresh();
                                },
                                child: Container(
                                  height: 80,
                                  width: 25,
                                  child: Icon(Icons.delete),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },itemCount: True!.todotask.length,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
