class BmiRecord {
  //BmiRecord class defines how BMI record looks like
  //also converts them between Dart and SQLite

  //normal constructor
  BmiRecord(
      {this.id,
      required this.height,
      required this.weight,
      required this.category,
      required this.gender,
      required this.age,
      required this.date,
      required this.bmi});

  final int? id;
  final double height;
  final double weight;
  final double bmi;
  final String category;
  final String date;
  final int age;
  final String gender;

  //To make the object creation automatically we use factory constructor
  // but before we need to create a dictionary to get the data
  //below function converts dart objects to sql rows by returning a Map
  //this function helps us to save data into SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'height': height,
      'weight': weight,
      'category': category,
      'gender': gender,
      'age': age,
      'date': date,
      'bmi': bmi
    };
  }

  //Creating a factory constructor to get data from sql rows
  // This function helps us to read data from a database because flutter does not get the data received from SQLite
  factory BmiRecord.fromMap(Map<String, dynamic> map) {
    return BmiRecord(
        id: map['id'],
        height: map['height'],
        weight: map['weight'],
        category: map['category'],
        gender: map['gender'],
        age: map['age'],
        date: map['date'],
        bmi: map['bmi']);
  }
}
