import 'package:flutter/material.dart';

import 'match_card.dart';

class NextMatches extends StatefulWidget {
  const NextMatches ({super.key});

  @override
  State<NextMatches> createState() => _NextMatchesState();
}

class _NextMatchesState extends State<NextMatches > {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future(() => null),
      builder: (context, snapshot){
        if(snapshot.hasError){
          return const Icon(Icons.warning);
        }
        else if(snapshot.hasData){
          return ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.all(5),
                child: MatchCard(),
              );
            });
        }
        else{
          return const CircularProgressIndicator();
        }
      }
    );
  }
}