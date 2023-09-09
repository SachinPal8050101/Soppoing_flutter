class ProductModel {
  String? id;
  String? name;
  String? desc;
  String? type;
  String? banner;
  int? unit;
  double? price;
  bool? available;
  String? suplier;
  String? availableForGender;

  ProductModel(
      {this.id,
      this.name,
      this.desc,
      this.type,
      this.banner,
      this.unit,
      this.price,
      this.available,
      this.suplier,
      this.availableForGender});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    desc = json['desc'];
    type = json['type'];
    banner = json['banner'];
    unit = json['unit'];
    price = json['price'].toDouble();
    available = json['available'];
    suplier = json['suplier'];
    availableForGender = json['availableForGender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['type'] = this.type;
    data['banner'] = this.banner;
    data['unit'] = this.unit;
    data['price'] = this.price;
    data['available'] = this.available;
    data['suplier'] = this.suplier;
    data['availableForGender'] = this.availableForGender;
    return data;
  }
}
