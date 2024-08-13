import 'package:flutter/material.dart';
import '../Reusables/product_card.dart'; // Adjust import path as needed

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
            _buildUserInfoSection(sampleDate),
            const SizedBox(height: 20.0),
            _buildAvailableProductsHeader(context),
            const SizedBox(height: 20.0),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detail');
                },
                child: ListView(
                  children: _buildProductList(context),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildUserInfoSection(String date) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: Row(
        children: <Widget>[
          const CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/shoes01.jpg'),
          ),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Hello, Aschalew',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvailableProductsHeader(BuildContext context) {
    return Row(
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
            },
          ),
        ),
      ],
    );
  }

  List<Widget> _buildProductList(BuildContext context) {
    return [
      ProductCard(
        imageUrl: 'assets/shoes01.jpg',
        title: 'Derby Leather Shoes',
        subtitle: "Men's shoes",
        price: 120,
        rating: 4.0,
        onTap: () {
          Navigator.pushNamed(context, '/detail');
        },
      ),
      ProductCard(
        imageUrl: 'assets/shoes01.jpg',
        title: 'Derby Leather Shoes',
        subtitle: "Men's shoes",
        price: 120,
        rating: 4.0,
        onTap: () {
          Navigator.pushNamed(context, '/detail');
        },
      ),
      ProductCard(
        imageUrl: 'assets/shoes01.jpg',
        title: 'Derby Leather Shoes',
        subtitle: "Men's shoes",
        price: 120,
        rating: 4.0,
        onTap: () {
          Navigator.pushNamed(context, '/detail');
        },
      ),
    ];
  }
}
