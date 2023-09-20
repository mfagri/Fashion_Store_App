import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/methodes/provider.dart';
import 'package:storeapp/pages/navigat/categorie.dart';

class Catrgorieshome extends StatefulWidget {
  const Catrgorieshome({super.key});

  @override
  State<Catrgorieshome> createState() => _CatrgorieshomeState();
}

class _CatrgorieshomeState extends State<Catrgorieshome> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Mangment>(
      builder: (context, value, child) => 
      Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              color: Colors.transparent, borderRadius: BorderRadius.circular(15)),
          child: ListView.builder(
                      padding: const EdgeInsets.all(5),
                      scrollDirection: Axis.horizontal,
                      itemCount: value.Categories.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllcategorieProducts(
                                      categorie: value.Categories[index].toString())),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'lib/images/${value.Categories[index]}.jpeg')),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        );
                      })
                
              
        ),
      ),
    );
  }
}
