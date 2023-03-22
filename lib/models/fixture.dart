import 'dart:convert';

class Fixture {
  final int id;
  final DateTime date;
  final String city;
  final String stadium;
  Fixture({
    required this.id,
    required this.date,
    required this.city,
    required this.stadium,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.millisecondsSinceEpoch,
      'city': city,
      'stadium': stadium,
    };
  }

  factory Fixture.fromMap(Map<String, dynamic> map) {
    return Fixture(
      id: map['id']?.toInt() ?? 0,
      date: DateTime.parse(map['date']),
      city: map['city'] ?? '',
      stadium: map['stadium'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Fixture.fromJson(String source) => Fixture.fromMap(json.decode(source));
}
