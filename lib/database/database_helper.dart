import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'bmi_model.dart';

//The database helper is responsible to manage the database
//basically the bmi_model knows how the BMI record looks like and database helper knows how to save them and retrieve

class DatabaseHelper {
  //Here we are saying that create one single database helper object inside the class itself and name it as instance
  // DatabaseHelper._init() => is a name constructor
  // we call this named constructor after creating the object named instance because we wanna create it once
  static final DatabaseHelper instance = DatabaseHelper._init();
  DatabaseHelper._init();

  //we create a variable with the type Database to have a place to store opened SQLite database
  //sicne at the beginning might be null we use Database?
  Database? _database;

  //means that in the future I will return a string
  //over below function tells that this function eventually will get a database
  Future<Database> get database async {
    if (_database != null) {
      //when we add (!) this sign we tell to Dart that we guarantee it's not null
      return _database!;
    } else {
      _database = await _initDB();
      return _database!;
    }
  }

  Future<Database> _initDB() async {
    //below line asks the phone where should I store the SQLite database, since takes time we use await
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'bmi.db');

    return await openDatabase(
      path,
      version: 1,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE bmi_history (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        height REAL NOT NULL,
        weight REAL NOT NULL,
        bmi REAL NOT NULL,
        category TEXT NOT NULL,
        date TEXT NOT NULL,
        age INTEGER NOT NULL,
        gender TEXT NOT NULL
      )
    ''');
  }
}
