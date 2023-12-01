import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_read_select_and_watch/customwidgets.dart';
import 'package:provider_with_read_select_and_watch/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BasicObjectProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.blue)
        ),
        home: const HomePage()
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage'), centerTitle: true),
      body: Column(
        children: [
          const Row(children: [Expanded(child: EObjectWidget()), Expanded(child: CObjectWidget())]),
          const Row(children: [Expanded(child: BasicObjectProviderWidget()),],),
          Row(children: [
            TextButton(onPressed: () => context.read<BasicObjectProvider>().start(), child: const Text('Start')),
            TextButton(onPressed: () => context.read<BasicObjectProvider>().stop(), child: const Text('Stop')),
          ])
        ],
      ),
    );
  }
}

