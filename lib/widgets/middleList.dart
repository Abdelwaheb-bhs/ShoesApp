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
 
  int _currentIndex = 0;
   List categories = ["LifeStyle", "Basketball", "Running", "Football", "Women"];

  

  

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
                          width: 150,
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
                                        NetworkImage(""),
                                  ),
                                  HelperFunctions().boxwidth15(giveWidth: 5),
                                  Text(
                                    categories[i],
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
            height: 500,
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







 