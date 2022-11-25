// create a stateless widget called HomeScreen
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

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
                mainAxisExtent: 15,
                crossAxisCount: 2,
                childAspectRatio: 5 / 3,
                crossAxisSpacing: 2,
              ),
              itemBuilder: (context, index) => GridTile(
                footer: Container(
                  margin: const EdgeInsets.only(bottom: 10, left: 10),
                  child: Text(
                    data[index].name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                ),
                child: Image.network(
                  data[index].imgUrl,
                  fit: BoxFit.fitWidth,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
