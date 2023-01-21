import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:twoaccountfirebasedifferentinjustproject/firebase_options.dart';
import 'package:twoaccountfirebasedifferentinjustproject/firebase_options_two.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final secondaryApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptionsTwo.currentPlatform,
  );

  runApp(
    MaterialApp(
      home: const MyApp(),
    ),);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
          },
        ),
      ),
      body: Center(
        child: Column(children: [

            Text('Acess In The Realtime DataBase twoaccountfirebaseone'),

            //only margin
            Container(margin: EdgeInsets.all(10),),

            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  elevation: 15,
                  shadowColor: Colors.black),
              child: Text(
                'Click for entering data in the twoaccountfirebaseone project',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                FirebaseDatabase database = FirebaseDatabase.instance;

                final date = DateTime.now().toString();
                final timenow = date.split('.');

                final DBRef = FirebaseDatabase.instance.ref('example/'+timenow[0]);

                await DBRef.set({
                  'timenow': timenow[0],
                });
              },
            ),

            //only margin
            Container(margin: EdgeInsets.all(10),),

            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  elevation: 15,
                  shadowColor: Colors.black),
              child: Text(
                'Click for delete all data in the twoaccountfirebaseone project',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                FirebaseDatabase database = FirebaseDatabase.instance;

                final date = DateTime.now().toString();
                final timenow = date.split('.');

                final DBRef = FirebaseDatabase.instance.ref('/');

                await DBRef.set(null);
              },
            ),

            Container(margin: EdgeInsets.all(20),),

            Text('Acess In The Realtime DataBase twoaccountfirebasetwo'),

            //only margin
            Container(margin: EdgeInsets.all(10),),

            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  elevation: 15,
                  shadowColor: Colors.black),
              child: Text(
                'Click for entering data in the twoaccountfirebasetwo project',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            ),

            //only margin
            Container(margin: EdgeInsets.all(10),),

            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.orange,
                  elevation: 15,
                  shadowColor: Colors.black),
              child: Text(
                'Click for delete data in the twoaccountfirebasetwo project',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
              },
            ),

        ]),
      ),
          );
  }

}