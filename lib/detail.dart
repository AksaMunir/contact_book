import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final String number;
  final Color darkTurquoise = Color.fromARGB(255, 3, 73, 74);
  final Color peach = Color.fromARGB(255, 207, 132, 75);

  DetailPage({
    required this.name,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'CONTACT INFORMATION',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'f1'),
        ),
        backgroundColor: darkTurquoise,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsQkg_GTbvmDTzeK9skpEcbtVpV2-PjwbdIazdERLNkQ&s',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Divider(
                color: darkTurquoise,
                thickness: 4,
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text(
                  'Mobile No.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(number),
                leading: Icon(Icons.phone, color: darkTurquoise),
              ),
              ListTile(
                title: Text(
                  'Phone No.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('0987654321'), // Sample phone number
                leading: Icon(Icons.phone, color: darkTurquoise),
              ),
              ListTile(
                title: Text(
                  'Organization',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('ABC Organization'),
                leading: Icon(Icons.business, color: darkTurquoise),
              ),
              ListTile(
                title: Text(
                  'WhatsApp',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('1234567890'),
                leading: Icon(Icons.message, color: darkTurquoise),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Call Recordings ",
                    style: TextStyle(
                        color: darkTurquoise,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.expand_more,
                    color: darkTurquoise,
                  )
                ],
              ),
              SizedBox(height: 30),
              Center(
                child: Container(
                  height: 50,
                  width: 200,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.delete),
                    label: Text(
                      'Delete',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: darkTurquoise,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
