import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_for_everyone/models/match.dart';
import 'package:http/http.dart' as http;

import '../models/fixture.dart';

class MatchService {
  var client = http.Client();

  Future<List<Match>> getNextMatches() async {
    try {
      await dotenv.load();
      var response = await client.get(
        Uri.http('https://api-football-v1.p.rapidapi.com/v3/timezone'),
        headers: {
          "X-RapidAPI-Key": '${dotenv.env['Server_football_key']}',
          "X-RapidAPI-Host": "api-football-v1.p.rapidapi.com"
        },
      );
      print(response.toString());
      return [];
    } catch (e) {
      print(e);
    }
    return [];
  }

  Stream<List<Match>> get nextMaches async* {
    dotenv.load();
    
    var response = await client.get(
      Uri.http('https://api-football-v1.p.rapidapi.com/v3/timezone'),
      headers: {
        "X-RapidAPI-Key": '${dotenv.env['Server_football_key']}',
        "X-RapidAPI-Host": "api-football-v1.p.rapidapi.com"
      },
    );
    print(response.toString());
    if (response.statusCode == 200) {
      // yield List<Match>> .from(json.decode(response.body).map(a){return Match.fromJson(a as Map<String, dynamic>)})  json.decode(response.body).map((list){
      //   return
      // });
      yield [];
    } else {
      yield [];
    }
  }
}

final matchServiceProvider = Provider((ref) => MatchService());
final teamServiceStream =
    StreamProvider<List<Match>>((ref) => MatchService().nextMaches);
