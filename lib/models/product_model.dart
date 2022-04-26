class ProductModel{
  String? id;
  String? imagePath;
  String? price;
  String? photographer;
  String? title;
  String? details;
  String? category;


  ProductModel({
    required this.id,
    required this.imagePath,
    required this.price,
    required this.photographer,
    required this.title,
    required this.details,
    required this.category,
  });

  ProductModel.fromJson(Map<String,dynamic> json){
    id = json["id"];
    imagePath = json["imagePath"];
    price = json["price"];
    photographer = json["photographer"];
    title = json["title"];
    details = json["details"];
    category = json["category"];
  }

  Map<String,dynamic> toMap(){
    return {
      "id" : id,
      "imagePath" : imagePath,
      "price" : price,
      "photographer" : photographer,
      "title" : title,
      "details" : details,
      "category" : category,
    };
  }

}
