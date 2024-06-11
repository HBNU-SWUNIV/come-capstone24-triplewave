import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class TodayDeliveryRequestCardList extends StatelessWidget {
  const TodayDeliveryRequestCardList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Container> cards = [
      Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(20)),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'From. 최창범 교수님',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                '사무실에서 진로설계 특강 출석확인표 보내주세요!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              )
            ],
          )),
      Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(20)),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'From. 최창범 교수님',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                '사무실에서 진로설계 특강 출석확인표 보내주세요!',
                style: TextStyle(color: Colors.white, fontSize: 13),
              )
            ],
          )),
      Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(20)),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'From. 최창범 교수님',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Text(
                '사무실에서 진로설계 특강 출석확인표 보내주세요!',
                style: TextStyle(color: Colors.white, fontSize: 13),
              )
            ],
          )),
    ];
    return Scaffold(
        body: Flexible(
            child: Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SizedBox(
          width: 400,
          height: 150, // 원하는 높이 지정
          child: CardSwiper(
            cardsCount: cards.length,
            scale: 0.9,
            cardBuilder:
                (context, index, percentTresholdX, percentThresholdY) =>
                    cards[index],
          )),
    )));
  }
}
