import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/pages/navigat/productdetailes.dart';
import '../../methodes/provider.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Mangment>(
      builder: (context, value, child) => 
     Padding(
        padding: const EdgeInsets.all(16.0),
        child: Favoritesbuild(product: value.Products)
            
      ),
    );
  }
}

class Favoritesbuild extends StatefulWidget {
  final dynamic product;
  const Favoritesbuild({super.key, required this.product});

  @override
  State<Favoritesbuild> createState() => _FavoritesbuildState();
}

class _FavoritesbuildState extends State<Favoritesbuild> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Mangment>(
      builder: (context, value, child) {
        return MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          itemCount: widget.product.length,
          itemBuilder: (context, index) {
            return Visibility(
              visible: value.inList(widget.product[index].id.toString()),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (value.inList(
                                  widget.product[index].id.toString())) {
                                // Item is in the list, handle the removal logic
                                value.remove_fromfavorit(
                                    widget.product[index].id.toString());
                              } else {
                                // Item is not in the list, handle the addition logic
                                value.add_tofsvorit(
                                    widget.product[index].id.toString());
                              }
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                // border: Border.all(),
                                // shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: value.inList(widget
                                        .product[index].id
                                        .toString())
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.favorite_border_sharp,
                                        color: Colors.black,
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          _gotoDetailsPage(context, widget.product[index]);
                        },
                        child: Container(
                          height: 140,
                          width: 140,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(137, 125, 124, 124),
                            image: DecorationImage(
                                image: NetworkImage(
                                    widget.product[index].image.toString()),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        height: 90,
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              Text(
                                widget.product[index].title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                               fontSize: 16,
                               fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    "\$" + widget.product[index].price,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _gotoDetailsPage(BuildContext context, dynamic data) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => 
         Scaffold(
           body: Center(
            child: Productdetails(data: data),
                 ),
         ),
      ),
    );
  }
}
