import 'package:flutter/material.dart';
import 'package:todo_app/todolisttile.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();
   List tasklist =[
    ['Make App',false],
    ['Create Screen',false],
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>_OnExit(context),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('To-Do'),
          centerTitle: true,
          leading: Icon(Icons.menu_book_rounded,size: 50,color: Colors.black,),
        ),

        body: ListView.builder(
            itemCount: tasklist.length,
            itemBuilder: (context,index){
              return ToDoListTile(
                taskname: tasklist[index][0],
                iscompleted: tasklist[index][1],);
            }),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add,size: 30),
          onPressed: (){
            showDialog(
                context: context,
                builder: (context){
                   return AlertDialog(
                     backgroundColor: Colors.yellow[200],
                     content: Container(
                       height: 200,
                       width: 200,
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           TextField(
                             controller: _controller,
                             decoration: InputDecoration(
                               hintText: 'Enter Task',
                               border: OutlineInputBorder()
                             ),
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               OutlinedButton(onPressed: () {
                                 if(_controller.text.isEmpty){
                                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Task Field Should Not Be Empty')));
                                   Navigator.pop(context);
                                 }else{
                                   setState(() {
                                     tasklist.add([_controller.text,false]);
                                     _controller.clear();
                                     print(tasklist.length);
                                     Navigator.pop(context);
                                   });
                                 }
                               }, child: Text('Add',style: TextStyle(color: Colors.black),)),
                               SizedBox(width: 10,),
                               OutlinedButton(onPressed: ()=>Navigator.pop(context), child: Text('Cancel',style: TextStyle(color: Colors.black),)),
                             ],
                           )
                         ],
                       ),
                     ),
                   );
                });
          },
        ),
      ),
    );
  }
}

Future<bool>_OnExit(BuildContext context) async{
  bool? exitapp = await showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          backgroundColor: Colors.yellow[200],
          title: Text('Exit ?'),
          content: Text('Are You Sure You Want To Exit ?'),
          actions: [
            OutlinedButton(onPressed: ()=>Navigator.of(context).pop(true), child: Text('Yes',style: TextStyle(color: Colors.black),)),
            OutlinedButton(onPressed: ()=>Navigator.of(context).pop(false), child: Text('No',style: TextStyle(color: Colors.black),)),
          ],
        );
      });
  return exitapp?? false;
}
