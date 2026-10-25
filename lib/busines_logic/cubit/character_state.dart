part of 'character_cubit.dart';

@immutable
sealed class CharacterState {}

final class CharacterInitial extends CharacterState {}
final class CharacterLoad extends CharacterState{
  final List<Character> characters;

  CharacterLoad(this.characters);

}