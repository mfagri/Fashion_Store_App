import 'package:flutter/material.dart';
import 'package:storeapp/api/api_service.dart';
import 'package:storeapp/pages/navigat/Homecomponents/products.dart';

class AllcategorieProducts extends StatefulWidget {
  final String categorie;
  const AllcategorieProducts({super.key,required this.categorie});

  @override
  State<AllcategorieProducts> createState() => _AllcategorieProductsState();
}

class _AllcategorieProductsState extends State<AllcategorieProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categorie,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: ApiService().getProductsBYcategorie(widget.categorie),
          initialData: const [],
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData && snapshot.data != null) {
              return test1(product: snapshot.data);
            } else {
              return const Center(child:  Text('No data'));
            }
          },
        ),
      )),
    );
  }
}