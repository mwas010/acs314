import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_1/configs/colors.dart';

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({required this.name, required this.price, this.quantity = 1});
}

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final List<CartItem> _items = [
    CartItem(name: 'Margherita', price: 14.99),
    CartItem(name: 'Pepperoni', price: 12.99, quantity: 2),
    CartItem(name: 'BBQ Chicken', price: 15.99),
  ];

  double get _subtotal =>
      _items.fold(0, (sum, i) => sum + i.price * i.quantity);
  double get _total => _subtotal * 0.9 + 2.99;

  void _increment(int i) => setState(() => _items[i].quantity++);
  void _decrement(int i) => setState(() {
    if (_items[i].quantity > 1) {
      _items[i].quantity--;
    } else {
      _items.removeAt(i);
    }
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: primaryColor,
        color: Colors.blueGrey,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.shopping_cart, size: 30),
          Icon(Icons.person_2, size: 30),
          Icon(Icons.logout, size: 30),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/homescreen');
              break;
            case 1:
              Navigator.pushNamed(context, '/cart');
              break;
            case 2:
              Navigator.pushNamed(context, '/profile');
              break;
            case 3:
              Navigator.pushNamed(context, '/');
              break;
          }
        },
      ),
      body:
          _items.isEmpty
              ? const Center(child: Text('Your cart is empty 🍕'))
              : Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: _items.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (_, i) {
                        final item = _items[i];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            item.name,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  item.quantity == 1
                                      ? Icons.delete_outline
                                      : Icons.remove,
                                ),
                                onPressed: () => _decrement(i),
                              ),
                              Text(
                                '${item.quantity}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () => _increment(i),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(height: 1),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '10% discount applied',
                              style: TextStyle(color: Colors.green),
                            ),
                            Text(
                              '-\$${(_subtotal * 0.1).toStringAsFixed(2)}',
                              style: const TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '\$${_total.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,

                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrangeAccent,
                              foregroundColor: Colors.white,
                            ),

                            onPressed: () {},
                            child: const Text('Place Order'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
