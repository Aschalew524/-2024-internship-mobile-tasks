import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Reusables/product_card.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    // Fetch products when the page is initialized
    final productBloc = BlocProvider.of<ProductBloc>(context);
    productBloc.add(GetAllProductsEvent());
  }

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
              child: BlocConsumer<ProductBloc, ProductState>(
                listener: (context, state) {
                  if (state is ProductOperationFailure) {
                    // Display an error message if the operation failed
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage)),
                    );
                  }
                },
                builder: (context, state) {
                  print('Current State: $state'); // Debug print to see the current state

                  if (state is AllProductsLoaded) {
                    print('Loaded Products: ${state.products}'); // Debug print to see the loaded products
                    return ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final item = state.products[index];
                        return ProductCard(
                          imageUrl: item.imageUrl,
                          title: item.name,
                          subtitle: "Men's shoes",
                          price: item.price.floorToDouble(),
                          rating: 4.0,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/detail',
                              arguments: item,  // Pass the product item as an argument
                            );
                          },
                        );
                      },
                    );
                  } else if (state is ProductsLoading) {
                    print('Loading Products...'); // Debug print when loading
                    return Center(child: CircularProgressIndicator());
                  } else {
                    print('No products found or error'); // Debug print for other states
                    return Center(child: Text('No products found'));
                  }
                },
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
}
