import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/detail.dart';
import 'package:providers/provider.dart';

class ContactsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color black = Color.fromARGB(255, 245, 245, 245);
    Color white = Color.fromARGB(255, 3, 73, 74);
    Color peach = Color.fromARGB(255, 207, 132, 75);

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 250,
            width: 370,
            color: black,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(width: 35),
                    Text(
                      'Contacts',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(width: 40),
                    Text(
                      'Deleted',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(width: 40),
                    Text(
                      'Favorites',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Container(
                      height: 40,
                      width: 350,
                      decoration: BoxDecoration(
                        color: black,
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(color: white, width: 2.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: white,
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search here',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    SizedBox(
                        height:
                            10), // Add spacing between the headers and contact list
                    Row(
                      children: [
                        SizedBox(width: 15),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: white,
                          ),
                          child: Image.network(
                            'https://cdn-icons-png.flaticon.com/256/3135/3135823.png',
                            height: 40,
                          ),
                        ),
                        SizedBox(width: 15),
                        Text(
                          "My Profile",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: peach,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height:
                            10), // Add spacing between "My Profile" and "My Groups"
                    Row(
                      children: [
                        SizedBox(width: 15),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 181, 197, 211),
                          ),
                          child: Image.network(
                            'https://cdn-icons-png.flaticon.com/512/2312/2312493.png',
                            height: 40,
                          ),
                        ),
                        SizedBox(width: 15),
                        Text(
                          "My Groups",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: peach,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Contacts',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Consumer<Count>(
            builder: (context, count, _) {
              List<Widget> contacts = [];
              for (int i = 0; i < count.contacts.length; i++) {
                contacts.add(
                  Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      color: black,
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Icon(
                          Icons.person_rounded,
                          color: white,
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                      name: count.contacts[i]['name'] ?? '',
                                      number: count.contacts[i]['number'] ?? '',
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                '${count.contacts[i]['name']}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Text(
                              '${count.contacts[i]['number']}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: white,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Column(
                children: contacts,
              );
            },
          ),
        ],
      ),
    );
  }
}
