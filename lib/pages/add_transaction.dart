//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:money_manager/db/db_manager.dart';
import 'package:money_manager/pages/styles/colors.dart';
import 'package:money_manager/pages/styles/styles.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  String type = 'Income'; //for btn
  DateTime selectedDate = DateTime.now();

  // DateTime selectedDate = DateTime.now();

  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  int? amount;
  String? description;

  Future<void> _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2010, 01),
        lastDate: DateTime(2050, 12));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.foam,
      appBar: AppBar(
        backgroundColor: AppColors.foam,
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
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (val) {
                try {
                  amount = int.parse(val);
                } catch (e) {}
              },
              decoration: const InputDecoration(
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
            child: TextField(
              keyboardType: TextInputType.text,
              maxLength: 30,
              onChanged: (val) {
                description = val;
              },
              decoration: const InputDecoration(
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
                label: Text(
                  'Cost',
                  style: TextStyle(
                      fontSize: 20,
                      color: type == 'Cost' ? AppColors.disable : AppColors.pine),
                ),
                selected: type == 'Cost' ? true : false,
                onSelected: (val) {
                  if (val) {
                    setState(() {
                      type = 'Cost';
                    });
                  }
                },
                selectedColor: AppColors.pine,
              ),
              const SizedBox(height: 100),
              ChoiceChip(
                label: Text(
                  'Income',
                  style: TextStyle(
                      fontSize: 20,
                      color: type == 'Income' ? AppColors.disable : AppColors.pine),
                ),
                selected: type == 'Income' ? true : false,
                onSelected: (val) {
                  if (val) {
                    setState(() {
                      type = 'Income';
                    });
                  }
                },
                selectedColor: AppColors.pine,
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  _selectedDate(context);
                },
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10, top: 8, bottom: 8),
                  // Set the internal padding of the container
                  decoration: BoxDecoration(
                    color: AppColors.ink, // Background color
                    borderRadius: BorderRadius.circular(5.0), // Rounded corners
                  ),
                  child: Text(
                    '${selectedDate.year.toString().substring(2)}-${months[selectedDate.month - 1]}-${selectedDate.day}',
                    style: AppStyles.subheading
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
           Padding(
            padding:const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: (){
                if(amount != null && description!.isNotEmpty){
                  DbManager dbmanager = DbManager();
                dbmanager.addData(amount!, selectedDate, description!, type);
                }else {print('Wrong');}

              },
              child: const Text(
                'Add',
                style: AppStyles.buttonOutlinedText
              ),
            ),
          ),
        ],
      ),
    );
  }
}
