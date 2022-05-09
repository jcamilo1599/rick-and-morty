import 'package:flutter/material.dart';

import '../../../models/character/character.dart';
import '../../pages/detail/detail.dart';

class CardWidget extends StatelessWidget {
  final CharacterModel character;

  const CardWidget({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(character.name),
      subtitle: Text('Especie: ${character.species}'),
      leading: Image.network(character.image),
      trailing: const Icon(Icons.arrow_right_rounded),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(character: character),
        ),
      ),
    );
  }
}
