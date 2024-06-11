import 'package:flutter/material.dart';

class Neighbor {
  final String name;
  final String imageUrl;

  Neighbor({required this.name, required this.imageUrl});
}

// 상태관리 : 앱이 사용자와 상호작용하면서 변경되는 데이터를 관리 -> ChangeNotifier
class NeighborsProvider extends ChangeNotifier {
  List<Neighbor> neighbors = [
    Neighbor(name: '황경호 교수', imageUrl: 'https://via.placeholder.com/150'),
    Neighbor(name: '김차종 교수', imageUrl: 'https://via.placeholder.com/150'),
    Neighbor(name: '이현빈 교수', imageUrl: 'https://via.placeholder.com/150'),
    Neighbor(name: '이정 교수', imageUrl: 'https://via.placeholder.com/150'),
    Neighbor(name: '김태훈 교수', imageUrl: 'https://via.placeholder.com/150'),
    Neighbor(name: '최창범 교수', imageUrl: 'https://via.placeholder.com/150'),
  ];
}
