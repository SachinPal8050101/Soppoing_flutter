abstract class CustomerProfileEvent {}

class CustomerFetchProfileEvent extends CustomerProfileEvent {}

class CustomerAddToWishListEvent extends CustomerProfileEvent {
  String productId;
  CustomerAddToWishListEvent(this.productId);
}
