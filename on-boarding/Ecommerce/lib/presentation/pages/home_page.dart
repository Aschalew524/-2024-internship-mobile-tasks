import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Reusables/product_card.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart'; // Adjust import path as needed

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    //final productBloc = BlocProvider.of<ProductBloc>(context);
    //productBloc.add(GetAllProductsEvent()); 

    context.read<ProductBloc>().add(GetAllProductsEvent());

    super.initState();

    
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
                  // Handle state changes, e.g., show snackbars
                  if (state is ProductsLoading){
                    
                  }
                },
                builder: (context, state) {
                  if (state is AllProductsLoaded) {
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
                            Navigator.pushNamed(context, '/detail');
                          },
                        );
                      },
                    );
                  }
                  if (state is ProductOperationFailure) {
                    return Center(child: Text(state.errorMessage));
                  }
                  return Center(child: Text('No products available.'));
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
