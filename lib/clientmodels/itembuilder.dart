class quizmodel {
  // static final catalog_model = catalogmodel.internal();
  // catalogmodel.internal();
  // factory catalogmodel() => catalog_model;
  static List<subjects> quizc = [
    subjects(
        id: 001,
        name: "Physics",
        desc: "15 MCQ questions",
        price: 999,
        // color: "#33505a",
        image: "assets/images/pexels-pixabay-60582.jpg"),
    subjects(
        id: 002,
        name: "Biology",
        desc: "15 MCQ questions",
        price: 999,
        // color: "#33505a",
        image: "https://cdn.mos.cms.futurecdn.net/BsV5RegZDhaNTHDx3nFHGN.jpg")
  ];
  // Getter for item by id
  // products getbyid(int id) =>
  //     items.firstWhere((element) => element.id == id, orElse: null);

  // products getbypositon(int pos) => items[pos];
}

class subjects {
  final int id;
  final String name;
  final String desc;
  final num price;
  // final String color;
  final String image;

  subjects(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      // required this.color,
      required this.image});

  factory subjects.fromjson(Map<String, dynamic> map) {
    return subjects(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        // color: map["color"],
        image: map["image"]);
  }
  tojson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        // "color": color,
        "image": image,
      };
}
