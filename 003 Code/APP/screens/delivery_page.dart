// class ReceivedDeliveryList extends StatelessWidget {
//   const ReceivedDeliveryList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // 예시 데이터
//     final List<Map<String, String>> requestedDeliveries = [
//       {'title': '최창범 교수님께서 서류 전달 요청', 'status': '배달 요청 수락'},
//       {'title': '황경호 교수님께서 서류 전달 요청 ', 'status': '배달 요청 수락 대기중'},
//       {'title': '김태훈 교수님께서 물품 전달 요청', 'status': '배달 요청 수락 거절'},
//     ];

//     return Column(
//       children: requestedDeliveries.map((delivery) {
//         return Card(
//           margin: const EdgeInsets.symmetric(vertical: 8.0),
//           child: ListTile(
//             title: Text(delivery['title']!),
//             subtitle: Text(delivery['status']!),
//             trailing: const Icon(
//               Icons.arrow_forward,
//               color: Colors.blue,
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }

// class RequestedDeliveryList extends StatelessWidget {
//   const RequestedDeliveryList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // 예시 데이터
//     final List<Map<String, String>> receivedDeliveries = [
//       {'title': '최창범 교수님께 서류 전달 요청', 'status': '배달 요청 수락'},
//       {'title': '황경호 교수님께 서류 전달 요청 ', 'status': '배달 요청 수락 대기중'},
//       {'title': '김태훈 교수님께 물품 전달 요청', 'status': '배달 요청 수락 거절'},
//     ];

//     return Column(
//       children: receivedDeliveries.map((delivery) {
//         return Card(
//           margin: const EdgeInsets.symmetric(vertical: 8.0),
//           child: ListTile(
//             title: Text(delivery['title']!),
//             subtitle: Text(delivery['status']!),
//             trailing: const Icon(
//               Icons.arrow_forward,
//               color: Colors.blue,
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
// // 배달 요청한 내역
//           const SizedBox(height: 50),
//           const Text(
//             '배달 요청받은 내역',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           // 배달 내역 리스트
//           const ReceivedDeliveryList(),
//           const SizedBox(height: 16),
//           // 배달 요청받은 내역
//           const Text(
//             '배달 요청한 내역',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           // 배달 내역 리스트
//           const RequestedDeliveryList(),