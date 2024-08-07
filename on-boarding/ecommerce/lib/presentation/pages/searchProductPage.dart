import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double price;
  final double rating;
  final VoidCallback onTap; // Add this line

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
    required this.onTap, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Add this line
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 180, // Reduced the height of the image
              width: double.infinity,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '\$${price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 14.0,
                          ),
                          const SizedBox(width: 2.0),
                          Text(
                            '($rating)',
                            style: TextStyle(
                              fontSize: 12.0,
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
          ],
        ),
      ),
    );
  }
}

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  _searchPageState createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  RangeValues _currentRangeValues = const RangeValues(0.0, 100.0);
  final TextEditingController _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Product'),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home'); // Navigate to the home page
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Leather',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.arrow_forward),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(12.0),
                  child: const Icon(
                    Icons.filter_list,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ProductCard(
              imageUrl: 'assets/shoes01.jpg',
              title: 'Derby Leather Shoes',
              subtitle: "Men's shoes",
              price: 49.99,
              rating: 4.5,
              onTap: () {
                // Navigate to the detail page
                Navigator.pushNamed(context, '/detail');
              },
            ),
            const SizedBox(height: 4),
            ProductCard(
              imageUrl: 'assets/shoes01.jpg',
              title: 'Derby Leather Shoes',
              subtitle: "Men's shoes",
              price: 49.99,
              rating: 4.5,
              onTap: () {
                // Navigate to the detail page
                Navigator.pushNamed(context, '/detail');
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Category',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _categoryController,
              decoration: const InputDecoration(
                hintText: 'Enter category',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Price',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 8.0),
            RangeSlider(
              values: _currentRangeValues,
              min: 0.0,
              max: 100.0,
              divisions: 20,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Add your button functionality here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Set the button color to blue
                minimumSize: const Size.fromHeight(50), // Set the minimum height to 50
                padding: EdgeInsets.zero, // Remove the padding
              ),
              child: const Text(
                'Apply',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0, // Adjust the font size as needed
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}