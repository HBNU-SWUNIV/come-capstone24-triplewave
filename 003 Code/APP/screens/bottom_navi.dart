import 'package:flutter/material.dart';
import 'package:capstone_delivery/screens/home_page.dart';
import 'package:capstone_delivery/screens/card_swiper.dart';

class BottomNavi extends StatefulWidget {
  const BottomNavi({super.key});

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: const TabBarView(
          children: [
            HomePage(),
            Center(
              child: Text("Delivery"),
            ),
            TodayDeliveryRequestCardList()
          ],
        ),
        extendBodyBehindAppBar: true, // add this line
        bottomNavigationBar: Container(
          color: Colors.white, //색상
          child: Container(
            height: 70,
            padding: const EdgeInsets.only(bottom: 10, top: 5),
            child: const TabBar(
              //tab 하단 indicator size -> .label = label의 길이
              //tab 하단 indicator size -> .tab = tab의 길이
              indicatorSize: TabBarIndicatorSize.label,
              //tab 하단 indicator color
              indicatorColor: Colors.blue,
              //tab 하단 indicator weight
              indicatorWeight: 6,
              //label color
              labelColor: Colors.blue,
              //unselected label color
              unselectedLabelColor: Colors.black38,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home_outlined,
                    size: 30,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.delivery_dining,
                    size: 30,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.settings,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
