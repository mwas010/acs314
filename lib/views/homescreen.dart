import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_1/configs/colors.dart';

class Pizza {
  final String name;
  final String description;
  final double price;
  final double originalPrice;
  final String image;
  final String badge;

  Pizza({
    required this.name,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.image,
    required this.badge,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Pizza> pizzas = [
    Pizza(
      name: 'Margherita Classic',
      description: 'Fresh tomato, mozzarella & basil',
      price: 9.99,
      originalPrice: 14.99,
      image: 'assets/margheritaclassic.jpeg',
      badge: '33% OFF',
    ),
    Pizza(
      name: 'Pepperoni Feast',
      description: 'Double pepperoni, cheddar, oregano',
      price: 12.49,
      originalPrice: 17.99,
      image: 'assets/pepperoni.jpg',
      badge: 'BEST SELLER',
    ),
    Pizza(
      name: 'BBQ Chicken',
      description: 'Grilled chicken, BBQ sauce, red onion',
      price: 13.99,
      originalPrice: 18.99,
      image: 'assets/bbqkanapizza.jpg',
      badge: 'NEW',
    ),
    Pizza(
      name: 'Veggie Supreme',
      description: 'Bell peppers, mushrooms, olives, spinach',
      price: 10.99,
      originalPrice: 15.49,
      image: 'assets/veggiesupreme.jpg',
      badge: '29% OFF',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text(
          '🍕 Today\'s Deals',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
       
      ),
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
          if (index == 0) Navigator.pushNamed(context, '/homescreen');
          if (index == 1) Navigator.pushNamed(context, '/cart');
          if (index == 2) Navigator.pushNamed(context, '/profile');
          if (index == 3) Navigator.pushNamed(context, '/');
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Section Title ---
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text(
                'Pizzas on Sale',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            // --- Pizza Grid ---
            Padding(
              padding: const EdgeInsets.all(12),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pizzas.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.72,
                ),
                itemBuilder:
                    (context, index) => _PizzaCard(pizza: pizzas[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// --- Pizza Card ---
class _PizzaCard extends StatelessWidget {
  final Pizza pizza;
  const _PizzaCard({required this.pizza});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image + Badge
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  pizza.image,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (_, __, ___) => Container(
                        height: 120,
                        color: Colors.orange.shade50,
                        child: const Center(
                          child: Text('🍕', style: TextStyle(fontSize: 48)),
                        ),
                      ),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    pizza.badge,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Info
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pizza.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  pizza.description,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '\$${pizza.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '\$${pizza.originalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
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
