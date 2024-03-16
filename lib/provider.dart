import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Count extends ChangeNotifier {
  List<Map<String, String>> contacts = [
    {'name': 'Gopi bahu', 'number': '1234567890'},
    {'name': 'Aham jee', 'number': '0987654321'},
    {'name': 'Kokila behn', 'number': '9876543210'},
    {'name': 'Raashi', 'number': '0123456789'},
    {'name': 'Urmila behn', 'number': '4564846568'},
    {'name': 'Meera', 'number': '5836486863'},
    {'name': 'Hetal', 'number': '2075076201'},
    {'name': 'Jigar Modi', 'number': '4835280753'},
    {'name': 'Janko ', 'number': '5683648676'},
  ];

  Future<void> incr(BuildContext context) async {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _numberController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Contact Info',
            style: TextStyle(color: Color.fromARGB(255, 3, 73, 74)),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Enter Name",
                ),
              ),
              TextField(
                controller: _numberController,
                decoration: InputDecoration(
                  hintText: "Enter Number",
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: Color.fromARGB(255, 3, 73, 74)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Add',
                style: TextStyle(color: Color.fromARGB(255, 3, 73, 74)),
              ),
              onPressed: () async {
                String newName = _nameController.text;
                String newNumber = _numberController.text;

                if (newName.isNotEmpty && newNumber.isNotEmpty) {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  contacts.add({'name': newName, 'number': newNumber});
                  await prefs.setStringList(
                      'contacts',
                      contacts
                          .map((contact) =>
                              '${contact['name']},${contact['number']}')
                          .toList());
                  notifyListeners();
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
