import '../../models/character/character.dart';

class CharacterMapper {
  Map<String, dynamic> data;

  CharacterMapper(this.data);

  CharacterModel execute() => CharacterModel(
        id: data['id'],
        name: data['name'],
        status: data['status'],
        species: data['species'],
        type: data['type'],
        gender: data['gender'],
        origin: data['origin'],
        location: data['location'],
        image: data['image'],
        episode: data['episode'],
        url: data['url'],
        created: data['created'],
      );
}
