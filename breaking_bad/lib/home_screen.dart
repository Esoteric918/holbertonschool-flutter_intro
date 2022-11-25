// create a stateless widget called HomeScreen
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';
import 'character_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  Future<List<Character>> fetchBbCharacters() async {
    // fetch the data from the api
    //returns: Future<List<Character>>
    final response =
        await http.get(Uri.parse('https://breakingbadapi.com/api/characters'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((character) => Character.fromJson(character))
          .toList();
    } else {
      throw Exception('Failed to load characters from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breaking Bad Quotes'),
      ),
      body: FutureBuilder<List<Character>>(
        future: fetchBbCharacters(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Character>? data = snapshot.data;
            return GridView.builder(
              itemCount: data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return CharacterTile(character: data[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Center(
                child: Container(
              width: 250,
              height: 150,
              alignment: const Alignment(0, 0),
              color: Colors.red,
              child: const Text(
                'Error',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ));
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
