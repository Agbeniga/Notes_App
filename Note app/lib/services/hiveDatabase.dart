import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class HiveDatabase {
  Future initHive() async {
    var getDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(getDocumentDirectory.path);
    await Hive.openBox('noteBox');
  }

  Future addNote(Map note) async {
    var box = await Hive.openBox('noteBox');
    await box.add(json.encode(note));
    box.close();
  }

   Future getNotes() async {
    var box =  await Hive.openBox('noteBox');
    var noteData = box.get('noteBox');
    if(noteData != null){
    return jsonDecode(noteData);
    }
    return [];
  }

  Future updateNote(int key, Map note) async {
    var box = await Hive.openBox('noteBox');
    await box.put(key, note);
    box.close();
  }

  Future deleteNote(int key) async {
    var box = await Hive.openBox('noteBox');
    await box.delete(key);
    box.close();
  }
}
