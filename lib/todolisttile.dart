import 'package:flutter/material.dart';

class ToDoListTile extends StatefulWidget {

  late final  String? task;
  late final  bool iscompleted;
  // ToDoListTile({
  //   required this.iscompleted,
  //   required this.task,
  // });

  ToDoListTile(@required String t,@required bool isc){
    this.task=t;
    this.iscompleted=isc;
  }


  @override
  State<ToDoListTile> createState() => _ToDoListTileState();
}

class _ToDoListTileState extends State<ToDoListTile> {
  bool myval = false;

  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            activeColor: Colors.black,
              value: myval,
              onChanged: (val){
                setState(() {
                  myval=!myval;
                });
              }),
          SizedBox(
            width: 35,
          ),
          Text(
            ' ${widget.task}',
            style: TextStyle(
                fontSize: 20,
                decoration: widget.iscompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none
                   ),
          ),
        ],
      ),
    );
  }
}
