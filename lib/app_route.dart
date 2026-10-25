import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar_st_b/busines_logic/cubit/character_cubit.dart';
import 'package:omar_st_b/contants/strings.dart';
import 'package:omar_st_b/data/models/characters.dart';
import 'package:omar_st_b/data/repositery/characters_repositery.dart';
import 'package:omar_st_b/data/web_serivces/characters_web_servies.dart';
import 'package:omar_st_b/prestation/screens/character_details_screen.dart';
import 'package:omar_st_b/prestation/screens/characters_screen.dart';

class AppRouter {
  late CharacterCubit characterCubit;
  late CharactersRepositery charactersRepositery;

  AppRouter() {
    charactersRepositery = CharactersRepositery(CharactersWebServies());
    characterCubit = CharacterCubit(charactersRepositery);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>characterCubit,
                // CharacterCubit(charactersRepositery),
            child: CharactersScreen(),
          ),
        );
      case charactersDetailsScreen:
      final character=settings.arguments as Character;
        return MaterialPageRoute(builder: (_) => CharacterDateailsScreen(character: character,));
    }
    return null;
  }
}
