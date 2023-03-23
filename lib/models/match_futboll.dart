import 'dart:convert';

import 'package:football_for_everyone/models/fixture.dart';
import 'package:football_for_everyone/models/team.dart';

class MatchFutboll {
  final Fixture fixture;
  final Team home;
  final Team away;
  
  MatchFutboll({
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

  factory MatchFutboll.fromMap(Map<String, dynamic> map) {
    return MatchFutboll(
      fixture: Fixture.fromMap(map['fixture']),
      home: Team.fromMap(map['teams']['home']),
      away: Team.fromMap(map['teams']['away']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MatchFutboll.fromJson(String source) => MatchFutboll.fromMap(json.decode(source));
}
