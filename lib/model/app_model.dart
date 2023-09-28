class AppModel {
  List<Catigory> categories;
  AppModel({
    required this.categories,
  });
}

class Catigory {
  int id;
  String name;
  String image;
  List<Product> products;
  Catigory({
    required this.id,
    required this.name,
    required this.image,
    required this.products,
  });
}

class Product {
  int id;
  String productName;
  String productImage;
  int productPrice;
  String productDescription;
  Product({
    required this.id,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productDescription,
  });
}
