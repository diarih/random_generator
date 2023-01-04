import 'package:flutter/material.dart';

import 'randomizer_page.dart';
import 'range_selector_form.dart';

typedef IntValueSetter = void Function(int value);

class RangePage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  RangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Range Selector'),
        // shadowColor: Colors.transparent,
        // centerTitle: true,
        // backgroundColor: Colors.black,
      ),
      body: RangeSelectorForm(
        formKey: formKey,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => const RandomizerPage())));
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        extendedPadding: const EdgeInsets.symmetric(horizontal: 50),
        label: const Text('Next'),
        backgroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
