import 'dart:convert';

CustomerModal customerModalFromJson(String str) =>
    CustomerModal.fromJson(json.decode(str));

String customerModalToJson(CustomerModal data) => json.encode(data.toJson());

class CustomerModal {
  CustomerModal({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.addressess,
    this.customeCart,
    this.customeWishlist,
    this.customeOrders,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? firstName;
  String? lastName;
  String? email;
  int? phoneNumber;
  List<String>? addressess;
  List<dynamic>? customeCart;
  List<dynamic>? customeWishlist;
  List<CustomeOrder>? customeOrders;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory CustomerModal.fromJson(Map<String, dynamic> json) => CustomerModal(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        addressess: List<String>.from(json["addressess"].map((x) => x)),
        customeCart: List<dynamic>.from(json["custome_cart"].map((x) => x)),
        customeWishlist:
            List<dynamic>.from(json["custome_wishlist"].map((x) => x)),
        customeOrders: List<CustomeOrder>.from(
            json["custome_orders"].map((x) => CustomeOrder.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "addressess": List<dynamic>.from(addressess!.map((x) => x)),
        "custome_cart": List<dynamic>.from(customeCart!.map((x) => x)),
        "custome_wishlist": List<dynamic>.from(customeWishlist!.map((x) => x)),
        "custome_orders":
            List<dynamic>.from(customeOrders!.map((x) => x.toJson())),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}

class CustomeOrder {
  CustomeOrder({
    this.orderId,
    this.status,
    this.amount,
    this.id,
  });

  String? orderId;
  String? status;
  int? amount;
  String? id;

  factory CustomeOrder.fromJson(Map<String, dynamic> json) => CustomeOrder(
        orderId: json["orderId"],
        status: json["status"],
        amount: json["amount"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "status": status,
        "amount": amount,
        "_id": id,
      };
}
