import 'package:ecomm_app_flutter/components/phone_tile.dart';
import 'package:ecomm_app_flutter/models/cart.dart';
import 'package:ecomm_app_flutter/models/phone.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addPhoneToCart(Phone phone) {
    Provider.of<Cart>(context, listen: false).addItemToCart(phone);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: const Text(
          'Successfully added!',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Check your cart',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Search', style: TextStyle(color: Colors.grey[500])),
                Icon(Icons.search, color: Colors.grey[500]),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text(
              "Does less, Costs More. It's that simple.",
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Hot Picks 🔥',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xFF121212),
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: value.getPhoneList().length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 25),
              itemBuilder: (context, index) {
                Phone phone = value.getPhoneList()[index];
                return PhoneTile(
                  phone: phone,
                  onTap: () => addPhoneToCart(phone),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Divider(color: Colors.grey[200], thickness: 1),
          ),
        ],
      ),
    );
  }
}
