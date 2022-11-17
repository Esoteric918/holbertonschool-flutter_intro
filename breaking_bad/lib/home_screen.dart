// create a stateless widget called HomeScreen

import 'package:flutter/material.dart';

Widget HomeScreen() {
  Future<List<Character>> fetchBbCharacters() async {
    // fetch the data from the api
    // https://breakingbadapi.com/api/characters
    // use the http package to make the request
    // https://pub.dev/packages/http
    // use the jsonDecode function to convert the response to a list of maps
    // https://api.dart.dev/stable/2.10.4/dart-convert/jsonDecode.html
    // use the map function to convert the list of maps to a list of Character objects
    // https://api.dart.dev/stable/2.10.4/dart-core/Iterable/map.html
    // return the list of Character objects
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breaking Bad'),
      ),
      body: FutureBuilder(
        future: fetchBbCharacters(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(snapshot.data[index].name),
                  leading: Image.network(snapshot.data[index].imgUrl),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
