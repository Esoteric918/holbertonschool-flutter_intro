import 'package:flutter/material.dart';
import 'models.dart';

class CharacterTile extends StatelessWidget {
  final Character character;
// Inside CharacterTile: Add class attribute :
  const CharacterTile({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(character),
      child: GridTile(
        child: Image.network(
          character.imgUrl,
          fit: BoxFit.fitWidth,
        ),
        footer: Container(
          margin: const EdgeInsets.only(bottom: 20, left: 20),
          child: Text(
            character.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 35,
            ),
          ),
        ),
      ),
    );
  }

  String onTap(Character character) {
    return (character.name);
  }
}
