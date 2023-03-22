import 'dart:convert';

class Team {
  final int id;
  final String name;
  final String logo;
  final String code;
  final String country;

  Team(
    this.id,
    this.name,
    this.logo,
    this.code,
    this.country,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'code': code,
      'country': country,
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      map['id']?.toInt() ?? 0,
      map['name'] ?? '',
      map['logo'] ?? '',
      map['code'] ?? '',
      map['country'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Team.fromJson(String source) => Team.fromMap(json.decode(source));


}
