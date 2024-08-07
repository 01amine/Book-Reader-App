import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meduim_challenge/provider/my_provider.dart';
import 'package:meduim_challenge/provider/ref.dart';
import 'package:meduim_challenge/view/my_screen.dart' as my_screen;
import 'package:meduim_challenge/view/my_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref
          .read(myNotifierProvider.notifier)
          .mapEventsToStates(const MyEvent.fetchData());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        my_screen.DetailsScreen.routeName: (_) =>
            const my_screen.DetailsScreen(),
      },
      title: 'MY APP',
      home: const MyScreen(),
    );
  }
}
