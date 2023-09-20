import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/methodes/provider.dart';
import 'package:storeapp/models/product.dart';

class Productdetails extends StatefulWidget {
  final product data;
  const Productdetails({super.key, required this.data});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Mangment>(
      builder: (context, value, child) => Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.55,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.data.image.toString()),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius:const  BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                                width: 200,
                                child: Text(
                                  widget.data.title.toString(),
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87),
                                ))
                          ],
                        ),
                        Container(
                            height: 40,
                            width: 40,
                            decoration:const  BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Center(
                                child: IconButton(
                                    onPressed: () {
                                      if (value
                                          .inList(widget.data.id.toString()))
                                          {

                                        value.remove_fromfavorit(
                                            widget.data.id.toString());
                                          }
                                      else {
                                        value.add_tofsvorit(
                                            widget.data.id.toString());
                                      }
                                    },
                                    icon:
                                        value.inList(widget.data.id.toString())
                                            ? const Icon(
                                                Icons.favorite,
                                                color: Colors.black,
                                              )
                                            :const  Icon(
                                                Icons.favorite_border_sharp,
                                                color: Colors.black,
                                              ))))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        StarRating(
                            rating: double.tryParse(
                                    widget.data.rating!.rate.toString()) ??
                                0),
                        Text(
                          " (${widget.data.rating!.count.toString()} Reviews)",
                          style:const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${widget.data.price.toString()}",
                          style:const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(widget.data.description.toString(), maxLines: 5),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30)),
                          child:const Center(
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 100,
                child: Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: 25,
                            )),
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final double rating;
  final int maxRating;

  const StarRating({super.key, required this.rating, this.maxRating = 5});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxRating, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 20,
        );
      }),
    );
  }
}
