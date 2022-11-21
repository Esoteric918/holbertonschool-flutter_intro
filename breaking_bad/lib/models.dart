// create a new class called Character with the following properties
// name, imgUrl, id

class Character {
  final String name;
  final String imgUrl;
  final int id;

  // create a constructor for the class that accepts one argument json with their corresponding values

  // Character({this.name, this.imgUrl, this.id});

  Character.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        imgUrl = json['img'],
        id = json['char_id'];
}
