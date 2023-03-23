import 'package:flutter/material.dart';

import '../../models/match_futboll.dart';


class MatchCard extends StatefulWidget {
  final MatchFutboll match;
  const MatchCard({super.key, required this.match});

  @override
  State<MatchCard> createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
        children: [
          SizedBox(width: 10,),
          Column(
            children: [
              Image.network(widget.match.home.logo, width: 40,height: 40,),
              Container(
                alignment: Alignment.center,
                width: 100,
                height: 30,
                child: Text(widget.match.home.name, style: TextStyle(fontSize: 8),),
              )
            ],
          ),
          Container(
            alignment: Alignment.center,
            width: 120,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(widget.match.fixture.date.toString(), style: TextStyle(fontSize: 8)),
            ]),
          ),
          Column(
            children: [
              Image.network(widget.match.away.logo, width: 40,height: 40,),
              Container(
                alignment: Alignment.center,
                width: 100,
                height: 30,
                child: Text(widget.match.away.name, style: TextStyle(fontSize: 8),),
              )
              
            ],
          ),
          SizedBox(width: 10,),
        ],
      ),
    );
  }
}