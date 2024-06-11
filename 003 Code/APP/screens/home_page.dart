import 'package:capstone_delivery/providers/neighbors_provider.dart';
import 'package:capstone_delivery/providers/deliveryrequests_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  

  @override
  Widget build(BuildContext context) {
    // NeighborsProvider 인스턴스를 가져옵니다.
    final neighborsProvider = Provider.of<NeighborsProvider>(context);

    // neighborsProvider에서 이웃 목록을 가져옵니다.
    final neighbors = neighborsProvider.neighbors;

    final deliveryRequestsProvider = Provider.of<RequestsProvider>(context);
    final deliveryRequests = deliveryRequestsProvider.deliveryRequests;

    return Scaffold(
        body: ListView(padding: const EdgeInsets.all(20.0), children: [
      const SizedBox(height: 100),
      const Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '반가워요, 수미님',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '오늘은 어떤 배달이 필요하신가요?',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
      const SizedBox(height: 50),
      // 프로필 섹션
      const Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.lightBlue,
            child: Icon(
              Icons.person, // 아이콘 추가
              size: 50, // 아이콘 크기 설정
              color: Colors.white, // 아이콘 색상 설정
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '김수미',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '학생',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Text(
                'N4동 컴퓨터공학과',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
      const SizedBox(height: 30),

      // 같은 과에 있는 사람들

      const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(
          Icons.format_quote, // 말풍선 아이콘
          size: 60, // 아이콘 크기
          color: Colors.blue, // 아이콘 색상
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            '같은 과 사람들에게 배달 요청을 해보세요!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ]),
      const SizedBox(height: 13),
      SizedBox(
          height: 80, // 프로필 사진 섹션 높이
          child: Stack(children: [ 
            ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 330.0, // 원하는 너비로 설정하여 처음에 보여지는 항목 수 조절
                ),
                child: Padding(
                    padding: const EdgeInsets.only(right: 60.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(neighbors.length, (index) {
                        final Neighbor neighbor = neighbors[index]; // 이웃 가져오기
                        return GestureDetector(
                          onTap: () {
                            _showNeighborDialog(context, neighbor);
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                const CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.blueGrey,
                                  child: Icon(
                                    Icons.person, // 아이콘 추가
                                    size: 20, // 아이콘 크기 설정
                                    color: Colors.white, // 아이콘 색상 설정
                                  ),
                                ),
                                Text(
                                  neighbor.name, // 이웃의 이름 표시
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ))),
            const Positioned(
              top: 0,
              right: 0,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.black12,
                child: Icon(
                  Icons.arrow_right_rounded, // 아이콘 추가
                  size: 40, // 아이콘 크기 설정
                  color: Colors.grey, // 아이콘 색상 설정
                ),
              ),
            ),
          ])),
      // 배달 요청한 내역
      const SizedBox(height: 50),
     
      const Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text(
            '오늘의 배달들',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            
              Expanded(
                  child: Card(
                      color: Colors.white,
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              request.requestorName,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              request.content,
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

  
              SizedBox(width: 16),
              Expanded(
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '수락한 내역',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '여기에 수락한 내역이 들어갑니다.',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ]));
  }
}

void _showNeighborDialog(BuildContext context, Neighbor neighbor) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: const SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30,
                  // 내 프로필 이미지 설정
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  child: Icon(
                    Icons.arrow_right, // 화살표 아이콘
                    color: Colors.blue,
                  ),
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blueGrey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              '전할 물건',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // 전할 물건 입력 필드
            TextField(
              decoration: InputDecoration(
                hintText: '전할 물건을 입력하세요',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            Text(
              '메시지 내용',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // 메시지 내용 입력 필드
            TextField(
              decoration: InputDecoration(
                hintText: '메시지 내용을 입력하세요',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 8),
            Text(
              '출발지',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // 출발지 입력 필드
            TextField(
              decoration: InputDecoration(
                hintText: '출발지를 입력하세요',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        )),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('전송'),
          ),
        ],
      );
    },
  );
}
