import 'package:exam_e_com_app/utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home_ extends StatefulWidget {
  const Home_({super.key});

  @override
  State<Home_> createState() => _Home_State();
}

class _Home_State extends State<Home_> {
  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey();
    int _index = 0;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('three');
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ],
        title: Text(
          "Home",
          style: GoogleFonts.philosopher().copyWith(),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "home",
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "Invoice",
            icon: Icon(
              Icons.print,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey.shade50,
        padding: const EdgeInsets.all(13),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Latest Items",
                      style: GoogleFonts.philosopher()
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 45),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    Container(
                      height: 200,
                      margin: const EdgeInsets.all(10),
                      width: 370,
                      padding: const EdgeInsets.only(top: 145, left: 21),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://i.pinimg.com/564x/63/04/73/6304731907ec3ddd7b3a1f9642c735e1.jpg"),
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      margin: const EdgeInsets.all(10),
                      width: 370,
                      padding: const EdgeInsets.only(top: 145, left: 21),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://i.pinimg.com/564x/b0/9d/2c/b09d2cf23ea08638c572d6e2f94c3ea9.jpg"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 90,
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "New Arrivals",
                      style: GoogleFonts.philosopher()
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 45),
                    ),
                  ),
                ],
              ),
              ...global.allProducts.map(
                (e) {
                  List data = e['data'];
                  return Container(
                    height: 330,
                    width: 500,
                    color: Colors.transparent,
                    child: Column(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...data.map((e) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      'two',
                                      arguments: e,
                                    );
                                  },
                                  child: Container(
                                    height: 320,
                                    width: 280,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    padding: const EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey.withOpacity(0.1),
                                      // border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 200,
                                          width: 260,
                                          decoration: BoxDecoration(
                                            //    border: Border.all(),
                                            color: Colors.grey,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade100,
                                                blurRadius: 24,
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image:
                                                  NetworkImage(e['thumbnail']),
                                            ),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: const Offset(-89, 10),
                                          child: Text(
                                            "\$ ${e['price']}",
                                            style: GoogleFonts.poppins()
                                                .copyWith(
                                                    fontSize: 23,
                                                    color: Colors.red),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: const Offset(-70, 20),
                                          child: Text(
                                            "${e['title']}",
                                            style:
                                                GoogleFonts.poppins().copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: const Offset(89, -34),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius:
                                                  BorderRadius.circular(23),
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  e['like'] = !e['like'];
                                                });
                                              },
                                              icon: (e['like'] == true)
                                                  ? const Icon(
                                                      CupertinoIcons.heart_fill,
                                                    )
                                                  : const Icon(
                                                      CupertinoIcons.heart,
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })
                            ],
                          ),
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
    );
  }
}
