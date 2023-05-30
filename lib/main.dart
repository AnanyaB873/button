import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
Future main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const button(),));
}
FirebaseFirestore firestore = FirebaseFirestore.instance;
class button extends StatefulWidget {
  const button({Key? key}) : super(key: key);

  @override
  State<button> createState() => _buttonState();
}

class _buttonState extends State<button> {

  void create() async {
    try {
      await firestore.collection('user').doc('Testuse').set({
        'firstname': 'ananya',
        'lastname': 'anamika',
        'age': '20',
      });
    }catch(e){
      print(e);
    }
  }
  void update() async{
    try{
      firestore.collection('user').doc('Testuse').update({
        'firstname' : 'babu',
        'age' : '40',
      });
    }catch(e){
      print(e);
    }
  }
  void read() async{
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot =
      await firestore.collection('user').doc('Testuser').get();
      print(documentSnapshot.data());
    }catch(e){
      print(e);
    }
  }
  void delete() async{
    try {
      firestore.collection('user').doc('Testuser').delete();
    }catch(e){
      print(e);
    }
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              create();
            },
                child: Text('create',style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold,color: Colors.red,),)),
            SizedBox(height: 10,),
            TextButton(onPressed: (){
              update();
            },
                child: Text('update',style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold,color: Colors.red,),)),
            SizedBox(height: 10,),
            TextButton(onPressed: (){
              read();
            },
                child: Text('read',style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold,color: Colors.red,),)),
            SizedBox(height: 10,),
            TextButton(onPressed: (){
              delete();
            },
                child: Text('delete',style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold,color: Colors.red,),)),
          ],
        ),
      ),
    );
  }
}

