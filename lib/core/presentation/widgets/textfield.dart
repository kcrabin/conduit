import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool? isObscure;
  TextInputType? inputType;
  TextEditingController controller;
  String labelText;
  String? Function(String?)? validator;
  int? lines;

  CustomTextField(
      {Key? key,
      this.isObscure = false,
      this.inputType,
      required this.controller,
      required this.labelText,
      this.validator,
      this.lines})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;
  @override
  void initState() {
    _obscureText = widget.isObscure == true ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.lines,
      obscureText: _obscureText,
      keyboardType: widget.inputType,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(8),
        suffix: widget.isObscure == false
            ? null
            : InkWell(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: _obscureText
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off)),
      ),
      validator: widget.validator,
    );
  }
}
