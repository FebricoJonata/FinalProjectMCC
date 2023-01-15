class Fish{
  late int id;
  late int user_id;
  late int fish_type_id;
  late String name;
  late String description;
  late int price;
  late String image_path;

  Fish({required this.id, required this.user_id, required this.fish_type_id, required this.name, required this.description, required this.price, required this.image_path});

  factory Fish.fromJson(Map<String, dynamic> json) {
    return Fish(
      id: json["id"] as int, 
      user_id: json["user_id"] as int, 
      fish_type_id: json["fish_type_id"] as int, 
      name: json["name"].toString(), 
      description: json["description"].toString(), 
      price: json["price"] as int, 
      image_path: json["image_path"].toString()
    );
  }
}