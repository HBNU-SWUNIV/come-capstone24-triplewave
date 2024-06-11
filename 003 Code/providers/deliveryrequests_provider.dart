import 'package:flutter/material.dart';

class DeliveryRequest {
  final String requestorName;
  final String content;

  DeliveryRequest({required this.requestorName, required this.content});
}

class RequestsProvider extends ChangeNotifier {
  List<DeliveryRequest> deliveryRequests = [
    DeliveryRequest(
        requestorName: "From. 황경호 교수님",
        content: "N5동 407호 키 받았던 거 다시 이쪽으로 보내도록."),
    DeliveryRequest(requestorName: "From. 임동건", content: "나 충전기 좀 빌려줄 수 있어?"),
    DeliveryRequest(
        requestorName: "From. 김태훈 교수님", content: "수미야, 사용한 IOT 키트 보내줘!"),
  ];
}
