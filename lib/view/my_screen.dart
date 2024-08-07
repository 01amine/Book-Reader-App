import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meduim_challenge/models/mymodel.dart';
import 'package:meduim_challenge/provider/my_provider.dart';
//import 'package:meduim_challenge/provider/ref.dart';
import 'package:url_launcher/url_launcher.dart';

class MyScreen extends ConsumerWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myNotifierProvider);
    final myList = state.myModelList;
    return state.isLoading!
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : !state.isConnected!
            ? const Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'There is no internet connection!',
                      ),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  title: const Text('MyBooks App'),
                ),
                body: ListView.builder(
                  itemCount: myList.length,
                  itemBuilder: (context, index) {
                    final item = myList[index];
                    return ListTile(
                      onTap: () => Navigator.of(context).pushNamed(
                        DetailsScreen.routeName,
                        arguments: item,
                      ),
                      title: Text(item.volumeInfo.title),
                      subtitle: Text(item.kind),
                    );
                  },
                ),
              );
  }
}

class DetailsScreen extends ConsumerWidget {
  const DetailsScreen({super.key});
  static const routeName = '/details';

  @override
  Widget build(BuildContext context, ref) {
    final MyModel myModel =
        ModalRoute.of(context)!.settings.arguments as MyModel;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Details Screen'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  myModel.volumeInfo.imageLinks?.thumbnail ?? '',
                  height: 400,
                  width: 500,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(myModel.volumeInfo.title),
                const SizedBox(
                  height: 20,
                ),
                Text(myModel.kind),
                const SizedBox(
                  height: 20,
                ),
                Text(myModel.volumeInfo.description ?? 'No description'),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: ElevatedButton(
                        onPressed: () {
                          final url = myModel.volumeInfo.previewLink;
                          if (url != null) {
                            launchUrl(Uri.parse(url));
                          }
                        },
                        child: const Text("Read"))),
              ],
            ),
          ),
        ));
  }
}
