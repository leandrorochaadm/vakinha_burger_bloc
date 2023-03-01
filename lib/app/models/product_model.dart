/// name : "Porção de 500g Calabresa acebolada"
/// description : ""
/// price : 19.0
/// image_path : "https://www.anamariabrogui.com.br/assets/uploads/receitas/fotos/usuario-1682-52acab79d88efd805e6a341697e6aecb.jpg"

class ProductModel {
  final String name;
  final String description;
  final double price;
  final String imagePath;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: json['name'],
        description: json['description'],
        price: json['price'],
        imagePath: json['image_path'],
      );

  ProductModel copyWith({
    String? name,
    String? description,
    double? price,
    String? imagePath,
  }) =>
      ProductModel(
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        imagePath: imagePath ?? this.imagePath,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['image_path'] = imagePath;
    return map;
  }
}
