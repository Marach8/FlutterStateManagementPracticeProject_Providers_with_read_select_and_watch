import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider_with_read_select_and_watch/customobject.dart';
import 'package:uuid/uuid.dart';


class BasicObjectProvider extends ChangeNotifier{
  late String id; late CObject _cObject; late EObject _eObject;
  late StreamSubscription _cObjectStreamSub, _eObjectStreamSub;
  CObject get cObject => _cObject;  EObject get eObject => _eObject;

  BasicObjectProvider(): id = const Uuid().v4(), _cObject = CObject(), _eObject = EObject() {start();}

  @override void notifyListeners() {id = const Uuid().v4(); super.notifyListeners();}

  void start(){
    _cObjectStreamSub = Stream.periodic(
      const Duration(seconds:1)).listen((_){_cObject = CObject(); notifyListeners();}
    );
    _eObjectStreamSub = Stream.periodic(
      const Duration(seconds:10)).listen((_){_eObject = EObject(); notifyListeners();}
    );
  }

  void stop(){_cObjectStreamSub.cancel(); _eObjectStreamSub.cancel();}
}