import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:omar_st_b/data/models/characters.dart';
import 'package:omar_st_b/data/repositery/characters_repositery.dart';
part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRepositery charactersRepositery;
   List<Character> characters=[];
  CharacterCubit(this.charactersRepositery) : super(CharacterInitial());

  List<Character> getAllCarachters() {
    charactersRepositery.getAllCarachters().then((characters) {
      emit(CharacterLoad(characters));
      this.characters = characters;
    });
    return characters;
  }
}
