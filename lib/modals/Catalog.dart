class Item {
  final int id;
  final String name;
  final String desc;
  final int price;
  final String about;
  final String color;
  final String image;

  Item(
      {this.id,
      this.name,
      this.desc,
      this.price,
      this.about,
      this.color,
      this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      about: map["about"],
      image: map["image"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "about": about,
        "image": image
      };
}

class CatalogModal {
  static List<Item> item;

  Item getById(int id) =>
      item.firstWhere((element) => element.id == id, orElse: null);

  Item getByPosition(int pos) => item[pos];
}
