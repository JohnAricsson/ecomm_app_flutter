import 'package:ecomm_app_flutter/models/phone.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<Phone> phoneShop = [
    Phone(
      name: 'Iphone 14 pro max',
      price: '110,000',
      imagePath: 'lib/images/iphone14pm.jpg',
      description: '2023 flagship, Best Sellers',
    ),
    Phone(
      name: 'Iphone 15 pro max',
      price: '120,000',
      imagePath: 'lib/images/iphone15pm.jpg',
      description: '2024 flagship, Best Sellers',
    ),
    Phone(
      name: 'Iphone 16 pro max',
      price: '130,000',
      imagePath: 'lib/images/iphone16pm.jpg',
      description: '2025 flagship, Best Sellers',
    ),
    Phone(
      name: 'Iphone 17 pro max',
      price: '150,000',
      imagePath: 'lib/images/iphone17pm.jpg',
      description: '2026 flagship, Best Sellers',
    ),
  ];
  List<Phone> userCart = [];

  List<Phone> getPhoneList() {
    return phoneShop;
  }

  List<Phone> getUserCart() {
    return userCart;
  }

  void addItemToCart(Phone phone) {
    userCart.add(phone);
    notifyListeners();
  }

  void removeItemFromCart(Phone phone) {
    userCart.remove(phone);
    notifyListeners();
  }
}
