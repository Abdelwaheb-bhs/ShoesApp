import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../ui_helper/helperFunctions.dart';
import '../widgets/gridViewShoes.dart';
// import 'package:practice_one/main.dart';

class MiddleListView extends StatefulWidget {
  const MiddleListView({Key? key}) : super(key: key);

  @override
  _MiddleListViewState createState() => _MiddleListViewState();
}

class _MiddleListViewState extends State<MiddleListView>
    with TickerProviderStateMixin {
  List<Map<String, dynamic>>  _myItems = [
   {
      "name": "Black Buckle Boot",
      "qte": 10,
      "prix": 59.99,
      "couleur": "Black",
      "taille": [38, 39, 40, 41],
      "genre": "Unisex",
      "imageURL": "https://example.com/images/black_buckle_boot.jpg",
    },
    {
      "name": "Black Lace-up Boot",
      "qte": 15,
      "prix": 69.99,
      "couleur": "Black",
      "taille": [40, 41, 42, 43],
      "genre": "Male",
      "imageURL": "https://example.com/images/black_lace_up_boot.jpg",
    },
    {
      "name": "Brown Open-Toe Sandals",
      "qte": 20,
      "prix": 34.99,
      "couleur": "Brown",
      "taille": [37, 38, 39],
      "genre": "Female",
      "imageURL": "https://example.com/images/brown_open_toe_sandals.jpg",
    },
    {
      "name": "Casual Moccasin",
      "qte": 25,
      "prix": 49.99,
      "couleur": "Brown",
      "taille": [39, 40, 41],
      "genre": "Male",
      "imageURL": "https://example.com/images/casual_moccasin.jpg",
    },
    {
      "name": "Kid's Navy Velcro Sneakers",
      "qte": 30,
      "prix": 29.99,
      "couleur": "Navy",
      "taille": [30, 31, 32],
      "genre": "Kids",
      "imageURL": "https://example.com/images/kids_navy_velcro_sneakers.jpg",
    },
    {
      "name": "Formal Tan Oxford",
      "qte": 18,
      "prix": 79.99,
      "couleur": "Tan",
      "taille": [40, 41, 42, 43],
      "genre": "Male",
      "imageURL": "https://example.com/images/formal_tan_oxford.jpg",
    },
    {
      "name": "Pink Orthopedic Sandals",
      "qte": 12,
      "prix": 54.99,
      "couleur": "Pink",
      "taille": [32, 33, 34],
      "genre": "Kids",
      "imageURL": "https://example.com/images/pink_orthopedic_sandals.jpg",
    },
    {
      "name": "Fur-Lined Winter Boot",
      "qte": 8,
      "prix": 89.99,
      "couleur": "Beige",
      "taille": [38, 39, 40],
      "genre": "Female",
      "imageURL": "https://example.com/images/fur_lined_winter_boot.jpg",
    },
    {
      "name": "Black High-Heel Boot",
      "qte": 10,
      "prix": 99.99,
      "couleur": "Black",
      "taille": [36, 37, 38],
      "genre": "Female",
      "imageURL": "https://example.com/images/black_high_heel_boot.jpg",
    },
    {
      "name": "Casual Brown Loafer",
      "qte": 22,
      "prix": 39.99,
      "couleur": "Brown",
      "taille": [39, 40, 41, 42],
      "genre": "Unisex",
      "imageURL": "https://example.com/images/casual_brown_loafer.jpg",
    },];
  int _currentIndex = 0;

  

  

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 5, vsync: this);

    return SafeArea(
      child: Column(
        children: [
          TabBar(
            controller: tabController,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            tabs: [
              for (int i = 0; i < 5; i++)
                Expanded(
                  child: Tab(
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 70,
                          width: 200,
                          child: Expanded(
                            child: Card(
                              // elevation: 3,
                              color: _currentIndex == i
                                  ? HelperFunctions().myGreen
                                  : const Color.fromARGB(255, 241, 241, 241),
                              // margin: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.white, width: 0.5),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    maxRadius: 20.0,
                                    backgroundImage:
                                        NetworkImage(_myItems[i]["imageURL"]),
                                  ),
                                  HelperFunctions().boxwidth15(giveWidth: 5),
                                  Text(
                                    _myItems[i]["name"],
                                    style: TextStyle(
                                        color: _currentIndex == i
                                            ? Colors.white
                                            : Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        HelperFunctions().boxwidth15(giveWidth: 7),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            height: 400,
            width: double.maxFinite,
            child: TabBarView(controller: tabController, children: [
              for (int i = 0; i < 5; i++)
                Expanded(child: GridViewShoes(currenIndexOfCategory: _currentIndex)),
            ]),
          ),
        ],
      ),
    );
  }
}







 