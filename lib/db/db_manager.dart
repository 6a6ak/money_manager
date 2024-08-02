import 'package:hive/hive.dart';

class DbManager {
  late Box box;

  DbManager() {
    openBox();
  }

  openBox() {
    box = Hive.box('money');
  }

  Future addData(
      int amount, DateTime date, String description, String type) async {
    var value = {
      'amount': amount,
      'date': date,
      'description': description,
      'type': type
    };
    box.add(value);}

    Future<Map> fetch(){
      if(box.values.isEmpty){
        return Future.value({});
      }else{return Future.value(box.toMap());}
    }
  }
