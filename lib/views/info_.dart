import 'package:flutter/material.dart';
import 'package:exam_e_com_app/utils/Global.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> d =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 90,
        titleTextStyle: const TextStyle(
            color: Colors.grey, fontSize: 34, fontWeight: FontWeight.bold),
        title: const Text("Detail"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 0,
        backgroundColor: Colors.blue.shade50,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          splashRadius: 20,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          "\$ ${d['price']}",
          style: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.blue.shade100,
        onPressed: () {
          setState(() {
            global.cartProducts.add(d);
            global.getqty++;
            global.totalPrice = global.TotalPrice();
          });
        },
        icon: const Icon(
          Icons.shopping_cart_checkout_rounded,
          color: Colors.white,
        ),
      ),
      body: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    ...d['images']
                        .map(
                          (e) => Container(
                            height: 350,
                            width: 360,
                            margin: const EdgeInsets.only(
                              top: 30,
                              left: 20,
                              right: 20,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              // boxShadow: [
                              //   BoxShadow(
                              //     blurRadius: 24,
                              //     color: Colors.orange.withOpacity(0.8),
                              //     offset: Offset(0, -4),
                              //   ),
                              // ],
                              color: Colors.grey.shade50,
                              image: DecorationImage(
                                  image: NetworkImage(e), fit: BoxFit.none),
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: Text(
                      "${d['title']}",
                      style: const TextStyle(
                        fontSize: 39,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: Text(
                      "${d['brand']}",
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(23),
                    color: Colors.blue.shade50,
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 10, bottom: 19, top: 10, right: 10),
                      height: 180,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Description",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              Text(
                                "⭐️${d['rating']}",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "${d['description']}",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
