import 'package:flutter/material.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
class Cartdetailes extends StatefulWidget {
  final dynamic data;
  const Cartdetailes({super.key, required this.data});

  @override
  State<Cartdetailes> createState() => _CartdetailesState();
}

class _CartdetailesState extends State<Cartdetailes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .5,
              child: ListView.builder(
                  itemCount: widget.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[300]),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: NetworkImage(widget
                                            .data[index].p.image
                                            .toString()))),
                              ),
                              Text(
                                "${widget.data[index].quantity.toString()} x ",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.orange),
                              ),
                              SizedBox(
                                width: 150,
                                child: Text(
                                  widget.data[index].p.title.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              Text(
                                '\$${widget.data[index].p.price}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.orange),
                              )
                            ]),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 4,
                decoration:const  BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight: Radius.circular(30)),
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Order Amount',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('\$${Total(widget.data).toString()}',
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.symmetric(horizontal: 8.0),
                        child: Center(
                            child: DottedDashedLine(height: 0, width: MediaQuery.of(context).size.width , axis: Axis.horizontal,dashColor: Colors.white,)
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tax',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text('\$10',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                     Padding(
                        padding:
                           const  EdgeInsetsDirectional.symmetric(horizontal: 8.0),
                        child: Center(
                            child: DottedDashedLine(height: 0, width: MediaQuery.of(context).size.width , axis: Axis.horizontal,dashColor: Colors.white,)
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total Payement',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text(
                              '\$${double.parse(Total(widget.data).toString()) + 10}',
                              style:const  TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.symmetric(horizontal: 8.0),
                        child: Center(
                            child: DottedDashedLine(height: 0, width: MediaQuery.of(context).size.width , axis: Axis.horizontal,dashColor: Colors.white,)
                        ),
                      ),
                      Container(
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: const Center(
                            child: Text('Checkout',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500))),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }

  // ignore: non_constant_identifier_names
  String Total(dynamic data) {
    double total = 0;
    for (int i = 0; i < data.length; i++) {
      try {
        double price = double.parse(data[i].p.price.toString());
        total += price;
      } catch (e) {
        // ignore: avoid_print
        print('Error parsing price for item at index $i: $e');
      }
    }
    return total.toString();
  }
}
