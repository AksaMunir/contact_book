import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/provider.dart';
import 'package:providers/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => Count(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.phone,
          color: Colors.white,
        ),
        title: Text(
          'CONTACT BOOK',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'f1',
              color: Colors.white,
              fontSize: 27),
        ),
        backgroundColor: Color.fromARGB(255, 3, 73, 74),
        centerTitle: true,
      ),
      body: ContactsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Count>(context, listen: false).incr(context);
        },
        child: Icon(
          Icons.add,
          color: Color.fromARGB(255, 3, 73, 74),
        ),
      ),
    );
  }
}
