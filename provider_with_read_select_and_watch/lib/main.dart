import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.blue)
      ),
      home: const HomePage()
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



class BasicObject{
  final String id, lastUpdated;
  BasicObject(): id = const Uuid().v4(), lastUpdated = DateTime.now().toIso8601String();

  @override
  bool operator ==(covariant BasicObject other) => id == other.id;
  
  @override
  int get hashCode => id.hashCode;  
}

@immutable
class EObject extends BasicObject{}
@immutable
class CObject extends BasicObject{}

class BasicObjectProvider extends ChangeNotifier{
  late String id; late CObject cObject; late EObject eObject;
  late StreamSubscription cObjectStreamSub, eObjectStreamSub;
}