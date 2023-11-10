import 'package:exam_e_com_app/utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart_ extends StatefulWidget {
  const Cart_({super.key});

  @override
  State<Cart_> createState() => _Cart_State();
}

class _Cart_State extends State<Cart_> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        centerTitle: true,
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
        titleTextStyle: const TextStyle(
            color: Colors.grey, fontSize: 34, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 0,
        backgroundColor: Colors.blue.shade50,
        title: const Text("Cart"),
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              ...global.cartProducts.map(
                (e) {
                  return Container(
                    height: 160,
                    width: 400,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.1),
                      // border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 130,
                          width: 160,
                          decoration: BoxDecoration(
                            //    border: Border.all(),
                            color: Colors.grey,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius: 24,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(e['thumbnail']),
                            ),
                          ),
                        ),
                        SizedBox(width: 23),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "\$ ${e['price']}",
                              style: GoogleFonts.poppins()
                                  .copyWith(fontSize: 23, color: Colors.red),
                            ),
                            Text(
                              "${e['title']}",
                              style: GoogleFonts.poppins().copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 23),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade50,
                                      blurRadius: 24,
                                      offset: Offset(0, 2)),
                                ],
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    global.cartProducts.remove(e);
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade50,
                                      blurRadius: 24,
                                      offset: Offset(0, 2)),
                                ],
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: (global.cartProducts == null) ? false : true,
        child: FloatingActionButton.extended(
          backgroundColor: Colors.blue.shade50,
          onPressed: () {
            Navigator.pushNamed(context, 'pdf');
          },
          label: Text("Invoice"),
          icon: Icon(
            Icons.print,
          ),
        ),
      ),
    );
  }
}
