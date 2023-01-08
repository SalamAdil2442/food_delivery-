class Cartmodel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool ?isExist;
  String? time;

  Cartmodel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExist,
    this.time,
  });

  Cartmodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
  }
}
