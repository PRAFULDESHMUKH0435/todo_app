import 'package:flutter/material.dart';
class ToDoListTile extends StatefulWidget {

  final String taskname;
  late  bool iscompleted;
  ToDoListTile({required this.taskname, required this.iscompleted});


  @override
  State<ToDoListTile> createState() => _ToDoListTileState();
}

class _ToDoListTileState extends State<ToDoListTile> {

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
              value: widget.iscompleted,
              onChanged: (val){
                setState(() {
                  widget.iscompleted=!widget.iscompleted;
                });
              }),
          SizedBox(
            width: 35,
          ),
          Text(
            widget.taskname,
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
