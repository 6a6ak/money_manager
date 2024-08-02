import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/db/db_manager.dart';
import 'package:money_manager/pages/add_transaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DbManager dbManager = DbManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff657b7c),
      appBar: AppBar(
        backgroundColor: const Color(0xff657b7c),
        title: const Text(
          'Money Manager',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddTransaction(),
            ),
          );
        },
        child: const Icon(Icons.add, size: 40, color: Colors.lime),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Here is some text before the containers',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            FutureBuilder<Map>(
              future: dbManager.fetch(),
              builder: (context, snapShot) {
                if (snapShot.hasError) {
                  return Center(
                    child: Text('Error'),
                  );
                }
                if (snapShot.hasData) {
                  if (snapShot.data!.isEmpty) {
                    return Center(
                      child: Text('No data'),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 15),
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [Colors.purple, Colors.blue],
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Dear User Welcome!',
                            style: TextStyle(
                              fontSize: 24,
                              color: Color(0xff092635),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: Text('Unexpected Error'),
                  );
                }
              },
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'This is a container',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'You can add more widgets here.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
