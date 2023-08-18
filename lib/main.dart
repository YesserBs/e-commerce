import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Name Storage App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _nameController;
  late String _storedName;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _storedName = "";
    // Load the stored name from the database
    _loadStoredName();
  }

  void _loadStoredName() async {
    final Database database = await openDatabase(
      join(await getDatabasesPath(), 'name_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE names(id INTEGER PRIMARY KEY, name TEXT)',
        );
      },
      version: 1,
    );

    final List<Map<String, dynamic>> maps = await database.query('names', limit: 1);
    if (maps.isNotEmpty) {
      setState(() {
        _storedName = maps.first['name'];
      });
    }
  }

  void _saveName(String newName) async {
    final Database database = await openDatabase(
      join(await getDatabasesPath(), 'name_database.db'),
      version: 1,
    );

    await database.delete('names');
    await database.insert(
      'names',
      {'id': 1, 'name': newName},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    setState(() {
      _storedName = newName;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your text:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              _storedName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter your name',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _saveName(_nameController.text);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
