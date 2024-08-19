import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/entities/productToAddEntity.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';

class addPage extends StatefulWidget {
  const addPage({super.key});

  @override
  _addPageState createState() => _addPageState();
}
class _addPageState extends State<addPage> {

  TextEditingController _nameController  = TextEditingController();
  TextEditingController _priceController  = TextEditingController();
  TextEditingController _descriptionController  = TextEditingController();

 File? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

 


 

    void saveProduct(){

      String name  = _nameController.text;
      double price = double.parse(_priceController.text);
      String description = _descriptionController.text; 
      File? image = _image ;
      if (_nameController.text.isEmpty || _descriptionController.text.isEmpty || image == null || _priceController.text.isEmpty){
        print("fill all the fields");
      }
      else{
          AddEntity addEntity = new AddEntity(description: description, image: image!, name: name, price: price);
          context.read<ProductBloc>().add(AddProductEvent(addEntity));
      }
      }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        leading: GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, '/home');
            // Navigator.pop(context);
          },

          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
      child:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child:  Center(
                 child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
         GestureDetector(
                onTap: () => _pickImage(ImageSource.gallery),
                child: Container(
                  height: 170,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: _image == null
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.upload_file),
                            SizedBox(height: 8.0),
                            Text("Upload Image"),
                          ],
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                ),
              )
                 ],
),

                ),
              ),
              const SizedBox(height: 16.0),
              // Name
              const Text('Name'),
              const SizedBox(height: 8.0),
              TextField(
                controller: _nameController ,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              // Category
              const Text('description'),
              const SizedBox(height: 8.0),
              TextField(
                controller: _descriptionController ,

                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              // Price
              const Text('Price'),
              const SizedBox(height: 8.0),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              // Description
              const Text('Description'),
              const SizedBox(height: 8.0),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                     saveProduct();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    child: const Text(
                      'ADD',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add delete functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    child: const Text(
                      'DELETE',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
       ) ),
      )
      ;
      
      
  
    
  }
}