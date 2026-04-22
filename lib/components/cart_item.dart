import 'package:ecomm_app_flutter/models/cart.dart';
import 'package:ecomm_app_flutter/models/phone.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final Phone phone;
  const CartItem({super.key, required this.phone});

  void removeItemFromCart(BuildContext context) {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(phone);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            phone.imagePath,
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          phone.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          '৳${phone.price}',
          style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: IconButton(
          onPressed: () => removeItemFromCart(context),
          icon: Icon(Icons.delete_outline, color: Colors.red[400]),
        ),
      ),
    );
  }
}
