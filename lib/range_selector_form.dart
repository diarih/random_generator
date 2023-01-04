import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_generator/randomizer_change_notifier.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends StatelessWidget {
  const RangeSelectorForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
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
                    context.read<RandomizerChangeNotifier>().min,
              ),
              const SizedBox(height: 16),
              RangeSelectorFormField(
                labelText: 'Minimum',
                intValueSetter: (value) =>
                    context.read<RandomizerChangeNotifier>().max,
              ),
            ],
          ),
        ));
  }
}

class RangeSelectorFormField extends StatelessWidget {
  const RangeSelectorFormField(
      {Key? key, required this.labelText, required this.intValueSetter})
      : super(key: key);

  final String labelText;
  final IntValueSetter intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      keyboardType:
          const TextInputType.numberWithOptions(decimal: false, signed: true),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return 'Please enter a number etc. 1, 2';
        } else {
          return null;
        }
      },
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')),
    );
  }
}
