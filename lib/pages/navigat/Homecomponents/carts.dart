import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/api/api_service.dart';
import 'package:storeapp/methodes/provider.dart';
import 'package:storeapp/pages/navigat/Homecomponents/cartsdetailes.dart';

class Shope extends StatefulWidget {
  const Shope({super.key});

  @override
  State<Shope> createState() => _ShopState();
}

class _ShopState extends State<Shope> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Mangment>(
      builder: (context, value, child) => Carts(
        data: value.Carts,
      ),
    );
  }
}

// ignore: must_be_immutable
class Carts extends StatefulWidget {
  List<List<test3>> data;
  Carts({super.key, required this.data});

  @override
  State<Carts> createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: widget.data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[400]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'All Prudacts in Cart',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Cartdetailes(
                                            data: widget.data[index])),
                                  );
                                },
                                child: Container(
                                    height: 60,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white),
                                    child: const Center(
                                        child:
                                            Icon(Icons.shopping_cart_rounded))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        // width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          color: Colors.grey[300],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.data[index].length,
                                itemBuilder: (context, index1) {
                                  return SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(widget
                                                    .data[index][index1].p.image
                                                    .toString()),
                                                fit: BoxFit.contain),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.white),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white54,
                                            ),
                                            child: Center(
                                                child: Text(
                                              widget
                                                  .data[index][index1].quantity
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
