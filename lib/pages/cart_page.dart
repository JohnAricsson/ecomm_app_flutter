import 'package:ecomm_app_flutter/components/cart_item.dart';
import 'package:ecomm_app_flutter/models/cart.dart';
import 'package:ecomm_app_flutter/models/phone.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        final userCart = value.getUserCart();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My Cart',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Color(0xFF121212),
                ),
              ),

              const SizedBox(height: 25),

              Expanded(
                child: userCart.isEmpty
                    ? const Center(
                        child: Text(
                          'Your cart is empty',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      )
                    : ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context, index) {
                          Phone individualPhone = userCart[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: CartItem(phone: individualPhone),
                          );
                        },
                      ),
              ),

              if (userCart.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Column(
                    children: [
                      Divider(color: Colors.grey[300]),
                      const SizedBox(height: 10),

                      const SizedBox(height: 20),
                      MaterialButton(
                        onPressed: () {},
                        color: Colors.black,
                        minWidth: double.infinity,
                        height: 60,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Checkout',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
