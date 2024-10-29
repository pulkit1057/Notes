import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:notes/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier{
  static late Isar isar;

  // initialization
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [NoteSchema],
      directory: dir.path,
    );
  }

  // list of notes
  final List<Note> currentNotes = [];

  // create - create a new note and save it to db
  Future<void> addNote(String textFromUser) async {
    final newNote = Note()..text = textFromUser;

    await isar.writeTxn(() => isar.notes.put(newNote));

    await fetchNotes();
  }
  // read - notes from db
  Future<void> fetchNotes() async {
    final fetchedNotes = await isar.notes.where().findAll();

    currentNotes.clear();

    currentNotes.addAll(fetchedNotes);

    notifyListeners();
  }

  // update
  Future<void> updateNote(Id id,String text) async{
    final existingNote = await isar.notes.get(id);

    if(existingNote != null)
    {
      existingNote.text = text;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

  // delete the note
  Future<void> deleteNote(Id id) async{
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
