import 'package:flutter/material.dart';
import 'package:simple_reels_flutter/data/repositories/video_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final repository = VideoRepository();
      final videoList = await repository.fetchVideoList();
      // print(videoList[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.black26,
                    height: 200,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Title',
                    style: TextStyle(fontSize: 24),
                  ),
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Text('Author'),
                  const Text('Duration'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
