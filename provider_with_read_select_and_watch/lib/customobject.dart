import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

@immutable
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