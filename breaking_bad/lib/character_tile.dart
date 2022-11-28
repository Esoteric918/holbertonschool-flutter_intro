import 'package:flutter/material.dart';
import 'quotes_screen.dart';
import 'models.dart';

class CharacterTile extends StatelessWidget {
  final Character character;

  const CharacterTile(this.character, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuotesScreen(character),
            ),
          );
        },
        child: Image.network(character.imgUrl),
      ),
      footer: GridTileBar(
        title: Text(character.name),
        backgroundColor: Colors.black54,
      ),
    ));
  }
}
