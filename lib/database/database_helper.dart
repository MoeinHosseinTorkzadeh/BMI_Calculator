import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'bmi_model.dart';

///The database helper is responsible to manage the database
//basically the bmi_model knows how the BMI record looks like and database helper knows how to save them and retrieve

class DatabaseHelper {
  ///Here we are saying that create one single database helper object inside the class itself and name it as instance
  /// DatabaseHelper._init() => is a name constructor
  /// we call this named constructor after creating the object named instance because we wanna create it once
  /// The reason we write static is because we wanna use it everywhere in the file and we say this variable belongs to the class rather than individual object
  static final DatabaseHelper instance = DatabaseHelper._init();
  DatabaseHelper._init();

  ///we create a variable with the type Database to have a place to store opened SQLite database
  ///sicne at the beginning might be null we use Database?
  Database? _database;

  ///means that in the future I will return a string
  ///over below function tells that this function eventually will get a database
  Future<Database> get database async {
    if (_database != null) {
      ///when we add (!) this sign we tell to Dart that we guarantee it's not null
      return _database!;
    } else {
      _database = await _initDB();
      return _database!;
    }
  }

  Future<Database> _initDB() async {
    ///below line asks the phone where should I store the SQLite database, since takes time we use await
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'bmi.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  ///Below function creates a database the reason we do not specify the type is because it is a void function
  Future<void> _createDB(Database db, int version) async {
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

  /// the reason this function returns an integer is because sqflite package will return the id of row inserted
  /// BELOW FUNCTION REFERS TO "C" from CRUD framework
  Future<int> insertBMI(BmiRecord record) async {
    /// Before anything else we need to create a connection to the database
    final databaseConnection = await instance
        .database; //instance is our single database helper object that is created inside the class itself
    /// In the instance.database the word database refers to the getter we made earlier basically we're calling that getter
    /// it is like saying if database exists give it to me otherwise make one
    return await databaseConnection.insert(
      'bmi_history',
      record.toMap(),
    );
  }

  /// Below method is responsible for "R"
  Future<List<BmiRecord>> getAllBMIRecords() async {
    final databaseConnection = await instance.database;

    ///making a connection with database
    final result = await databaseConnection.query('bmi_history');
    // this is equivalent to SELECT * FROM bmi_history to get and display all data

    ///empty list to add record while we loop through
    List<BmiRecord> records = [];

    ///looping through the results we got from bmi history and storing them in the empty records list
    for (var map in result) {
      records.add(
        BmiRecord.fromMap(map),
      );
    }
    return records;
  }
}
