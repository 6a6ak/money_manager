import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'New Transaction',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade50, //bg color
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Amount',
                  hintText: 'Amount',
                  prefixIcon: Icon(
                    Icons.money,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade50, // رنگ پس‌زمینه
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                keyboardType: TextInputType.number,
                maxLength: 30,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                  hintText: 'Write a description ',
                  prefixIcon: Icon(
                    Icons.money,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment:  MainAxisAlignment.spaceAround,
              children: [
                ChoiceChip(
                  label: Text('Cost',
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                  selected: true,
                  selectedColor: Colors.indigo,
                ),
                SizedBox(height: 100),
                ChoiceChip(
                  label: Text('Income',
                      style: TextStyle(fontSize: 24, color: Colors.indigo)),
                  selected: false,
                  selectedColor: Colors.indigo,
                ),
                const SizedBox(height:20),
                TextButton(onPressed: () {},
                  child: const Text ('Transaction Date', style: TextStyle(fontSize: 24, color: Colors.white),
                  ),),
              ],
            ),


          ],
        ));
  }
}
