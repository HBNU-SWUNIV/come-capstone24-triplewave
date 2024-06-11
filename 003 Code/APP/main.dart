import 'package:capstone_delivery/providers/neighbors_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/bottom_navi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) =>
                  NeighborsProvider()), // NeighborsProvider를 MultiProvider에 추가
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Capstone Delivery',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const BottomNavi(),
        ));
  }
}
