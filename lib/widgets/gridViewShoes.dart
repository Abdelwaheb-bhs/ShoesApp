import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../ui_helper/helperFunctions.dart';
import 'shoesDetails.dart';


class GridViewShoes extends StatefulWidget {
  int currenIndexOfCategory;
  GridViewShoes({Key? key, required this.currenIndexOfCategory})
      : super(key: key);

  @override
  _GridViewShoesState createState() => _GridViewShoesState();
}

class _GridViewShoesState extends State<GridViewShoes> {
  List _myShoes = [{
      "id": 1,
      "name": "Black Buckle Boot",
      "qte": 10,
      "prix": 59.99,
      "couleur": "Black",
      "taille": [38, 39, 40, 41],
      "genre": "Unisex",
      "imageURL": "https://example.com/images/black_buckle_boot.jpg",
    },
    {
      "id": 2,
      "name": "Black Lace-up Boot",
      "qte": 15,
      "prix": 69.99,
      "couleur": "Black",
      "taille": [40, 41, 42, 43],
      "genre": "Male",
      "imageURL": "https://example.com/images/black_lace_up_boot.jpg",
    },
    {
      "id": 3,
      "name": "Brown Open-Toe Sandals",
      "qte": 20,
      "prix": 34.99,
      "couleur": "Brown",
      "taille": [37, 38, 39],
      "genre": "Female",
      "imageURL": "https://example.com/images/brown_open_toe_sandals.jpg",
    },
    {
      "id": 4,
      "name": "Casual Moccasin",
      "qte": 25,
      "prix": 49.99,
      "couleur": "Brown",
      "taille": [39, 40, 41],
      "genre": "Male",
      "imageURL": "https://example.com/images/casual_moccasin.jpg",
    },
    {
      "id": 5,
      "name": "Kid's Navy Velcro Sneakers",
      "qte": 30,
      "prix": 29.99,
      "couleur": "Navy",
      "taille": [30, 31, 32],
      "genre": "Kids",
      "imageURL": "https://example.com/images/kids_navy_velcro_sneakers.jpg",
    },
    {
      "id": 6,
      "name": "Formal Tan Oxford",
      "qte": 18,
      "prix": 79.99,
      "couleur": "Tan",
      "taille": [40, 41, 42, 43],
      "genre": "Male",
      "imageURL": "https://example.com/images/formal_tan_oxford.jpg",
    },
    {
      "id": 7,
      "name": "Pink Orthopedic Sandals",
      "qte": 12,
      "prix": 54.99,
      "couleur": "Pink",
      "taille": [32, 33, 34],
      "genre": "Kids",
      "imageURL": "https://example.com/images/pink_orthopedic_sandals.jpg",
    },
    {
      "id": 8,
      "name": "Fur-Lined Winter Boot",
      "qte": 8,
      "prix": 89.99,
      "couleur": "Beige",
      "taille": [38, 39, 40],
      "genre": "Female",
      "imageURL": "https://example.com/images/fur_lined_winter_boot.jpg",
    },
    {
      "id": 9,
      "name": "Black High-Heel Boot",
      "qte": 10,
      "prix": 99.99,
      "couleur": "Black",
      "taille": [36, 37, 38],
      "genre": "Female",
      "imageURL": "https://example.com/images/black_high_heel_boot.jpg",
    },
    {
      "id": 10,
      "name": "Casual Brown Loafer",
      "qte": 22,
      "prix": 39.99,
      "couleur": "Brown",
      "taille": [39, 40, 41, 42],
      "genre": "Unisex",
      "imageURL": "https://example.com/images/casual_brown_loafer.jpg",
    },];
  // List categories = ["LifeStyle", "Basketball", "Running", "Football", "Women"];
  List fileNames = [
    // "assets/files/myshoes.json",
    "assets/files/myshoes_basketball.json",
    "assets/files/myshoes.json",
    // "assets/files/myshoes_basketball.json",
    "assets/files/myshoes.json",
    // "assets/files/myshoes_basketball.json",
    "assets/files/myshoes_basketball.json",
    // "assets/files/myshoes_basketball.json",
    "assets/files/myshoes.json",
    // "assets/files/myshoes.json",
  ];

  void initState() {
    super.initState();
    readShoesData();
  }

  Future<void> readShoesData() async {
    final String response =
        await rootBundle.loadString(fileNames[widget.currenIndexOfCategory]);
    final data = jsonDecode(response);

    
  }

  @override
  Widget build(BuildContext context) {
    return _myShoes.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8,
                  mainAxisExtent: 250,
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemCount: _myShoes.length,
                itemBuilder: (context, index) {
                  return Card(
                    key: ValueKey(_myShoes[index]["id"]?? "Description not available"),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShoesDetails(
                                    shoeName: _myShoes[index]["qte"]?? "Description not available")));
                      },
                      child: Container(
                        // height: 200,
                        // width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  // border: Border.all(color: Colors.black, width: 4),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Transform.rotate(
                                    angle: -math.pi / 6,
                                    child: Image.asset(
                                      _myShoes[index]["imageURL"]?? "Description not available",
                                      alignment: Alignment.topCenter,
                                    )),
                              ),
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Men's Shoes + ${widget.currenIndexOfCategory}",
                                          style: TextStyle(
                                            color: HelperFunctions().myGreen,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      HelperFunctions()
                                          .boxHeight15(giveHeight: 5),
                                      Text(_myShoes[index]["desc"]?? "Description not available",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 18,
                                          )),
                                      HelperFunctions()
                                          .boxHeight15(giveHeight: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("₹${_myShoes[index]["prix"]}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 17,
                                              )),
                                          InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      HelperFunctions()
                                                          .myAlertDialog(
                                                        context: context,
                                                      ));
                                            },
                                            child: CircleAvatar(
                                              backgroundColor: Colors.black,
                                              child: Icon(
                                                Icons
                                                    .add_shopping_cart_outlined,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          )
        : Center(
            child: ElevatedButton(
                onPressed: () {
                  readShoesData();
                },
                child: Text("Nothing fetched, Check")));
  }
}