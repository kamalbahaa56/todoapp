

import 'package:flutter/material.dart';
import 'package:flutter_application_todo/templet.dart';

import '../model/task_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List alltasks = 
   [
   
   ];
   final TasksController = TextEditingController();

   Changestatus(int taskIndex){
    setState(() {
      alltasks[taskIndex].status=!alltasks[taskIndex].status;
    });
   
   }
   func(){
    
    setState(() {
   alltasks.add(Task(Title: '${TasksController.text}',status: false),);
    });
   }
  int funcCalculateTasks(){
    int doneTasks = 0;
    
 setState(() {
    for (var element in alltasks) {
    if (element.status) {
      doneTasks++;
    }
   }
 });
    return doneTasks;
   }
    ddeletetask(int deletetasks){
      setState(() {
        alltasks.remove(alltasks[deletetasks]);
      });
    }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        title: Text('TO DO APP'),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              alltasks.removeRange(0, alltasks.length);
            });
          }, icon: Icon(Icons.delete)),
        ],
        backgroundColor:  Color.fromRGBO(58, 66, 86, 0.7),
      ),
    body:alltasks.length>0? Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Text('${funcCalculateTasks()}/${alltasks.length}',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context,index){
              return Column(
                children: [
                  TempltetCard(title: alltasks[index].Title,status:alltasks[index].status ,myfunc:Changestatus,Indexx: index,deletetask: ddeletetask,)
                ],
              );
            },
           itemCount: alltasks.length,
            physics: BouncingScrollPhysics(),
          ),
        )
        ], 
      ),
    ):Center(child: Image.asset('assets/image/iconn.png')),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Color.fromRGBO(209, 224, 224, 0.2  ),
      onPressed: (){
        showModalBottomSheet(context: context, builder: (context)
        {
          return Container(
            padding: EdgeInsets.all(20),
            color: Colors.amber[100],         
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
             // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller:TasksController ,
                  maxLength: 50,
                  decoration:InputDecoration(
                    hintText: "New Task",
                  ) ,
                ),  
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  TextButton(onPressed: ()async{
                  await  func();
                    TasksController.clear();
                  }, 
                  child: Text('add')
                  ),
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                    TasksController.clear();
                  }, 
                  child: Text('cancel'),
                  )
                ],)
              ],
            ),
          );
        });
      },child: Icon(Icons.add),
    ),
    );
  }
}
 //  ...alltasks.map((element) =>TempltetCard(title:element.Title ,status: element.status,) ),