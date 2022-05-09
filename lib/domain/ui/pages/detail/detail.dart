import 'package:flutter/material.dart';

import '../../../models/character/character.dart';
import '../../templates/template_main.dart';

class DetailPage extends StatefulWidget {
  static const String routeName = '/detail';

  final CharacterModel? character;

  const DetailPage({
    Key? key,
    this.character,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return TemplateMainWidget(
      title: 'Detalle de ${widget.character?.name}',
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 40),
        children: [
          Image.network(widget.character!.image),
          const SizedBox(height: 20),
          Text(
            'Genero: ${widget.character?.gender}',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            'Origen: ${widget.character?.origin['name']}',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            'Ubicación: ${widget.character?.location['name']}',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            'Número de episodios: ${widget.character?.episode.length}',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
