class Character {
  late int id;
  late String name;
  late String status;
  late String species;
  late String gender;
  late String image;
  late List<String> episode;
  late String url;
  late String created;

  Character.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    status = json["status"];
    species = json["species"];
    gender = json["gender"];
    image = json["image"];
    url = json["url"];
    episode = List<String>.from(json["episode"] ?? []);
    // episode=json["episode"];
    url = json["url"];
    created = json["created"];
  }
}
