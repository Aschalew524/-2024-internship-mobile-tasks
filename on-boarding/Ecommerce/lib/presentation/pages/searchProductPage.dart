import 'package:flutter/material.dart';
import '../Reusables/product_card.dart';// Import the ProductCard widget

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  RangeValues _currentRangeValues = const RangeValues(0.0, 100.0);
  final TextEditingController _categoryController = TextEditingController();
  bool _showFilters = false;

  void _applyFilters() {
    setState(() {
      _showFilters = false; // Hide the filter section
    });
    // Add any additional functionality you want to trigger when the "Apply" button is clicked
  }

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
      body: Stack(
        children: [
          Padding(
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
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showFilters = !_showFilters;
                        });
                      },
                      child: Container(
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
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Expanded(
                  child: ListView(
                    children: [
                      ProductCard(
                        imageUrl: 'assets/shoes01.jpg',
                        title: 'Derby Leather Shoes',
                        subtitle: "Men's shoes",
                        price: 49.99,
                        rating: 4.5,
                        onTap: () {
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
                          Navigator.pushNamed(context, '/detail');
                        },
                      ),
                      const SizedBox(height: 16.0),
                      ProductCard(
                        imageUrl: 'assets/shoes01.jpg',
                        title: 'Derby Leather Shoes',
                        subtitle: "Men's shoes",
                        price: 49.99,
                        rating: 4.5,
                        onTap: () {
                          Navigator.pushNamed(context, '/detail');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            bottom: _showFilters ? 0 : -300, // Adjust the height as needed
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: _showFilters ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      onPressed: _applyFilters,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size.fromHeight(50),
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text(
                        'Apply',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
