import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_generator/main.dart';



class RandomizerPage extends ConsumerWidget {
  const RandomizerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref ) {
    final randomizer = ref.watch(randomizerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Randomizer'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            return Text(
                randomizer.generatedNumber?.toString() ?? 'No number generated',
                style: const TextStyle(fontSize: 36));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref.watch(randomizerProvider).generatedRandomNumber();
        },
        label: const Text('Generate'),
        backgroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
