import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_read_select_and_watch/customobject.dart';
import 'package:provider_with_read_select_and_watch/provider.dart';

class EObjectWidget extends StatelessWidget {
  const EObjectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final eObjectData = context.select<BasicObjectProvider, EObject>(
      (eObjectProvider) => eObjectProvider.eObject
    );
    return Container(
      height: 100, color: Colors.blue,
      child: Column(
        children: [
          const Text('Very Expensive Object'),
          const Text('Previous Update Time'),
          Text(eObjectData.lastUpdated)
        ]
      )
    );
  }
}


class CObjectWidget extends StatelessWidget {
  const CObjectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cObjectData = context.select<BasicObjectProvider, CObject>(
      (cObjectProvider) => cObjectProvider.cObject
    );
    return Container(
      height: 100, color: Colors.yellow,
      child: Column(
        children: [
          const Text('Very Cheap Object'),
          const Text('Previous Update Time'),
          Text(cObjectData.lastUpdated)
        ]
      )
    );
  }
}



class BasicObjectProviderWidget extends StatelessWidget {
  const BasicObjectProviderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final objectProviderData = context.watch<BasicObjectProvider>();
    return Container(
      height: 100, color: Colors.green,
      child: Column(
        children: [
          const Text('Watching all changes in the provider'),
          const Text('id'),
          Text(objectProviderData.id)
        ]
      )
    );
  }
}