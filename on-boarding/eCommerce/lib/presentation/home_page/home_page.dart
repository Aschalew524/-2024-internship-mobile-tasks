import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String sampleDate = 'July 30, 2024';

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // User information section
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: Row(
                children: <Widget>[
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/shoes01.jpg'), // User photo
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Hello, Aschalew', // User's name
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        sampleDate, // Sample date
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Available Products',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey[400]!),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/search');
                      // Add search action here
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0), // Space after row
            // Product list
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detail');
                  // Navigator.pop(context);
                },
                child: ListView(
                  children: const [
                    ProductCard(
                      imageUrl: 'assets/shoes01.jpg',
                      title: 'Derby Leather Shoes',
                      subtitle: "Men's shoes",
                      price: 120,
                      rating: 4.0,
                    ),
                    ProductCard(
                      imageUrl: 'assets/shoes01.jpg',
                      title: 'Derby Leather Shoes',
                      subtitle: "Men's shoes",
                      price: 120,
                      rating: 4.0,
                    ),
                    ProductCard(
                      imageUrl: 'assets/shoes01.jpg',
                      title: 'Derby Leather Shoes',
                      subtitle: "Men's shoes",
                      price: 120,
                      rating: 4.0,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //print('+ button pressed');
          Navigator.popAndPushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double price;
  final double rating;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fitWidth, // Change fit property
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16.0,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          '($rating)',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}