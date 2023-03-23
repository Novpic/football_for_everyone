import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/match_service.dart';
import 'match_card.dart';

class NextMatches extends ConsumerStatefulWidget {
  const NextMatches({super.key});

  @override
  ConsumerState<NextMatches> createState() => _NextMatchesState();
}

class _NextMatchesState extends ConsumerState<NextMatches> {
  @override
  Widget build(BuildContext context) {
    final streamMatch = ref.watch(teamServiceStream);
    return streamMatch.when(
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text(error.toString()),
        data: (data) {
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  child: MatchCard(match: data[index]),
                );
              });
        });
  }
}
