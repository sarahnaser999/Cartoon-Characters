import 'package:omar_st_b/data/models/characters.dart';
import 'package:omar_st_b/data/web_serivces/characters_web_servies.dart';

class CharactersRepositery {
  final CharactersWebServies charactersWebServies;
  CharactersRepositery(this.charactersWebServies);

  Future<List<Character>> getAllCarachters() async {
    final character = await charactersWebServies.getAllCarachters();
    return character.map((character) => Character.fromJson(character)).toList();
  }
}
