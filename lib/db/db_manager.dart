import  'package:hive/hive.dart';

class DbManager {

  late Box box;

  DbManager(){
    openBox();
  }
  openBox(){
    box= Hive.box('money');
  }
  Future addData (int amount,DateTime date,String description, String type) async {var value = {'amount': amount,'date': date,'description': description, 'type': type};
  }
}