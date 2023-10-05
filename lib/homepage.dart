import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                showsnackbar(context);
                // opendialog(context);
              }, child: Text('Click Me'))
            ],
          ),
        ),
      ),
    );
  }


  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showsnackbar(BuildContext context){
      final snackbar = SnackBar(content: Row(
      children: [
        Icon(Icons.person,color: Colors.white,),
        SizedBox(width: 20,),
        Text('This Is SnackBar')
      ],
    ),action: SnackBarAction(label: 'Undo',
          textColor: Colors.white, onPressed: (){}),duration: Duration(seconds: 5),
           elevation: 15.0,
           backgroundColor: Colors.green,);
      return ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  Future opendialog(BuildContext context){
    return showModalBottomSheet(context: context, builder: (context){
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('MyAccount'),
            leading: Icon(Icons.person),
          ),
          ListTile(
            title: Text('My Profile'),
            leading: Icon(Icons.wallet),
          ),
        ],
      );
    });
  }
}
