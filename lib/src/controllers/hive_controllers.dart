import 'package:hive_flutter/hive_flutter.dart';
import 'package:pet_adoption_app/src/utils/constants.dart';

class HiveDb {
  static setPetDataInHive(String data) async {
    try {
      await clearDataFromHive();
      Box box = await Hive.openBox(petDb);
      box.add(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<String> getPetHistoryDataFromHive() async {
    try {
      Box box = await Hive.openBox(petDb);
      //ALWAYS AT INDEX 0
      var data = box.getAt(0);
      return data;
    } catch (e) {
      return "";
    }
  }

  static clearDataFromHive() async {
    try {
      Box box = await Hive.openBox(petDb);
      box.clear();
      return true;
    } catch (e) {
      return false;
    }
  }
}
