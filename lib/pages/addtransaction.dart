import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  String type = 'Income'; //for btn

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
    color: Colors.lightBlue.shade50,
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
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    ChoiceChip(
    label: Text('Cost',
    style: TextStyle(
    fontSize: 20,
    color: type == 'Cost' ? Colors.white : Colors.indigo),
    ),
      selected: type == 'Cost' ? true : false,
      onSelected: (val) {
        if (val) {
          setState(() {
            type = 'Cost';
          });
        }
      },
    selectedColor: Colors.indigo,
    ),
    SizedBox(height: 100),
    ChoiceChip(
    label: Text(
    'Income',
    style: TextStyle(
    fontSize: 20,
    color: type == 'Income' ? Colors.white : Colors.indigo),
    ),
    selected: type == 'Income' ? true : false,
    onSelected: (val) {
    if (val) {
    setState(() {
    type = 'Income';
    });
    }
    },
    selectedColor: Colors.indigo,
    ),
    SizedBox(height: 20),
    TextButton(
    onPressed: null,
    child: Text(
    'Trans Date',
    style: TextStyle(fontSize: 20, color: Colors.white),
    ),
    ),
    ],
    ),
    const SizedBox(height: 20),
    const Padding(
    padding: EdgeInsets.all(8.0),
    child: ElevatedButton(
    onPressed: null,
    child: Text(
    'Add',
    style: TextStyle(color: Colors.white, fontSize: 20),
    ),
    ),
    ),
    ]
    ,
    )
    ,
    );
  }
}
