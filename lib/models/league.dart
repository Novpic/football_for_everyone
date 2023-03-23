import 'dart:convert';

class League {
  final int id;
  final String name;
  final String contry;
  final String logo;

  League({
    required this.id,
    required this.name,
    required this.contry,
    required this.logo,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'contry': contry,
      'logo': logo,
    };
  }

  factory League.fromMap(Map<String, dynamic> map) {
    return League(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      contry: map['contry'] ?? '',
      logo: map['logo'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory League.fromJson(String source) => League.fromMap(json.decode(source));
}
