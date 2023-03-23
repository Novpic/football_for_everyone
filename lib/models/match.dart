import 'dart:convert';

import 'package:football_for_everyone/models/fixture.dart';
import 'package:football_for_everyone/models/team.dart';

class Match {
  final Fixture fixture;
  final Team home;
  final Team away;
  
  Match({
    required this.fixture,
    required this.home,
    required this.away,
  });


  Map<String, dynamic> toMap() {
    return {
      'fixture': fixture.toMap(),
      'home': home.toMap(),
      'away': away.toMap(),
    };
  }

  factory Match.fromMap(Map<String, dynamic> map) {
    return Match(
      fixture: Fixture.fromMap(map['fixture']),
      home: Team.fromMap(map['teams']['home']),
      away: Team.fromMap(map['teams']['away']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Match.fromJson(String source) => Match.fromMap(json.decode(source));
}
