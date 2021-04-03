

import 'package:flags_quiz_app/moduls/flags.dart';

import 'databaseHelper.dart';

class Flagsdao{


  Future<List<Flags>> randomGet5() async {
    var db = await DataBaseHelper.databaseAcces();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM flags ORDER BY RANDOM() LIMIT 5");

    return List.generate(maps.length, (i) {
      var line = maps[i];
      return Flags(line["flags_id"], line["flags_name"], line["flags_photo"]);
    });
  }

  Future<List<Flags>> randomGetFalse3(int flags_id) async {
    var db = await DataBaseHelper.databaseAcces();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM flags WHERE flags_id != $flags_id ORDER BY RANDOM() LIMIT 3");

    return List.generate(maps.length, (i) {
      var line = maps[i];
      return Flags(line["flags_id"], line["flags_name"], line["flags_photo"]);
    });
  }

}