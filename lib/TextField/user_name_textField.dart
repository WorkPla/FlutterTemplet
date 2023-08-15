import 'package:flutter/material.dart';

class UserNameField extends StatefulWidget {
  const UserNameField({Key? key}) : super(key: key);

  @override
  _UserNameFieldState createState() => _UserNameFieldState();
}

class _UserNameFieldState extends State<UserNameField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        floatingLabelBehavior:
            FloatingLabelBehavior.never, //Hides label on focus or if filled
        labelText: "Name",
        //filled: true, // Needed for adding a fill color
        //fillColor: Colors.grey.shade800,
        isDense: true, // Reduces height a bit
        border: OutlineInputBorder(
            //borderSide: BorderSide.none, // No border
            //borderRadius: BorderRadius.circular(12), // Apply corner radius
            ),
        prefixIcon: Icon(Icons.supervised_user_circle, size: 24),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
        ),
      ),
    );
  }
}
