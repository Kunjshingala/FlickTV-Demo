import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screen/home/home.dart';
import 'utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      title: 'Flick TV Example',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        overscroll: false, // Disables overscroll glow/bounce globally
      ),
      theme: ThemeData.dark(useMaterial3: true),
      builder: (context, child) {
        final data = MediaQuery.of(context);

        dimensions.setDeviceHeight = data.size.height;
        dimensions.setDeviceWidth = data.size.width;

        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
          child: child ?? SizedBox.shrink(),
        );
      },
      home: HomeScreen(),
    );
  }
}
