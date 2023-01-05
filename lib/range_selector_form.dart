import 'package:flutter/material.dart';
import 'package:random_generator/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef IntValueSetter = void Function(int? value);

class RangeSelectorForm extends ConsumerWidget {
  const RangeSelectorForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RangeSelectorFormField(
                labelText: 'Minimum',
                intValueSetter: (value) =>
                    ref.read(randomizerProvider.notifier).setMin(value!),
              ),
              const SizedBox(height: 16),
              RangeSelectorFormField(
                labelText: 'Minimum',
                intValueSetter: (value) =>
                    ref.read(randomizerProvider.notifier).setMax(value!),
              ),
            ],
          ),
        ));
  }
}

class RangeSelectorFormField extends ConsumerWidget {
  const RangeSelectorFormField(
      {Key? key, required this.labelText, required this.intValueSetter})
      : super(key: key);

  final String labelText;
  final IntValueSetter intValueSetter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final randomizer = ref.watch(randomizerProvider);

    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      keyboardType:
          const TextInputType.numberWithOptions(decimal: false, signed: true),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          // debugPrint(value);
          return 'Please enter a number etc. 1, 2';
        } else {
          return null;
        }
      },
      onChanged: (newValue) => {
        if (newValue == '')
          {intValueSetter(0)}
        else
          {intValueSetter(int.parse(newValue))}
      },
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')),
    );
  }
}
