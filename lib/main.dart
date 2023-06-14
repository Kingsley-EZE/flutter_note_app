import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'screens/notes.dart';
import 'screens/add_note.dart';
import 'package:provider/provider.dart';
import 'providers/color_provider.dart';
import 'providers/note_provider.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  /*final database = openDatabase(
    join(await getDatabasesPath(), 'doggie_database.db'),
    onCreate: (db, version){
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)'
      );
    },
    version: 1,
  );*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ColorProvider()),
          ChangeNotifierProvider(create: (context) => NoteProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: NotesScreen(),
        ),
    );
  }
}
