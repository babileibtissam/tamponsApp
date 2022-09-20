import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInput extends StatelessWidget {
  const AppInput(
      {Key? key,
      required this.textController,
      this.inputValidator,
      this.formatters,
      this.inputType,
      this.onChange,
      this.hintText,
      this.labelText,
      this.lines = 1})
      : super(key: key);

  final TextEditingController textController;
  final String? hintText;
  final String? labelText;
  final int lines;
  final String? Function(String?)? inputValidator;
  final List<TextInputFormatter>? formatters;
  final TextInputType? inputType;
  final void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      maxLines: lines,
      validator: inputValidator,
      inputFormatters: formatters,
      keyboardType: inputType,
      onChanged: onChange,
      decoration: InputDecoration(
        focusColor: const Color.fromARGB(255, 1, 188, 194),
        fillColor: const Color.fromARGB(255, 1, 188, 194),
        hintText: hintText,
        labelText: labelText,
        border: const OutlineInputBorder(),
        suffixIcon: textController.text.isEmpty
            ? Container(
                width: 0,
              )
            : IconButton(
                onPressed: () => textController.clear(),
                icon: const Icon(Icons.close),
              ),
      ),
    );
  }
}
