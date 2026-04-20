import 'package:ecomm_app_flutter/components/phone_tile.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Search'),
              Icon(Icons.search, color: Colors.blue),
            ],
          ),
        ),

        const Padding(
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Text(
            "Does less, Costs More. It's that simple.",
            style: TextStyle(color: Colors.blue),
          ),
        ),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hot picks',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text('See all', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),

        const SizedBox(height: 10),

        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return PhoneTile();
            },
          ),
        ),
      ],
    );
  }
}
