// https://pub.dev/packages/multi_select_flutter/example

import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}

class MultiSelectionExample extends StatefulWidget {
  MultiSelectionExample({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MultiSelectionExampleState createState() => _MultiSelectionExampleState();
}

class _MultiSelectionExampleState extends State<MultiSelectionExample> {
  static List<Animal> _animals = [
    Animal(id: 1, name: "Lion"),
    Animal(id: 2, name: "Flamingo"),
    Animal(id: 3, name: "Hippo"),
    Animal(id: 4, name: "Horse"),
    Animal(id: 5, name: "Tiger"),
    Animal(id: 6, name: "Penguin"),
    Animal(id: 7, name: "Spider"),
    Animal(id: 8, name: "Snake"),
    Animal(id: 9, name: "Bear"),
    Animal(id: 10, name: "Beaver"),
    Animal(id: 11, name: "Cat"),
    Animal(id: 12, name: "Fish"),
    Animal(id: 13, name: "Rabbit"),
    Animal(id: 14, name: "Mouse"),
    Animal(id: 15, name: "Dog"),
    Animal(id: 16, name: "Zebra"),
    Animal(id: 17, name: "Cow"),
    Animal(id: 18, name: "Frog"),
    Animal(id: 19, name: "Blue Jay"),
    Animal(id: 20, name: "Moose"),
    Animal(id: 21, name: "Gecko"),
    Animal(id: 22, name: "Kangaroo"),
    Animal(id: 23, name: "Shark"),
    Animal(id: 24, name: "Crocodile"),
    Animal(id: 25, name: "Owl"),
    Animal(id: 26, name: "Dragonfly"),
    Animal(id: 27, name: "Dolphin"),
  ];
  final _items = _animals
      .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
      .toList();
  //List<Animal> _selectedAnimals = [];
  List<Animal> _selectedAnimals2 = [];
  List<Animal> _selectedAnimals3 = [];
  //List<Animal> _selectedAnimals4 = [];
  List<Animal> _selectedAnimals5 = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    _selectedAnimals5 = _animals;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              //################################################################################################
              // Rounded blue MultiSelectDialogField
              //################################################################################################
              MultiSelectDialogField(
                items: _items,
                title: Text("Animals"),
                selectedColor: Colors.blue,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                buttonIcon: Icon(
                  Icons.pets,
                  color: Colors.blue,
                ),
                buttonText: Text(
                  "Favorite Animals",
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontSize: 16,
                  ),
                ),
                onConfirm: (results) {
                  //_selectedAnimals = results;
                },
              ),
              SizedBox(height: 50),
              //################################################################################################
              // This MultiSelectBottomSheetField has no decoration, but is instead wrapped in a Container that has
              // decoration applied. This allows the ChipDisplay to render inside the same Container.
              //################################################################################################
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(.4),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    MultiSelectBottomSheetField(
                      initialChildSize: 0.4,
                      listType: MultiSelectListType.CHIP,
                      searchable: true,
                      buttonText: Text("Favorite Animals"),
                      title: Text("Animals"),
                      items: _items,
                      onConfirm: (values) {
                        _selectedAnimals2 = values as List<Animal>;
                      },
                      chipDisplay: MultiSelectChipDisplay(
                        onTap: (value) {
                          setState(() {
                            _selectedAnimals2.remove(value);
                          });
                        },
                      ),
                    ),
                    _selectedAnimals2.isEmpty
                        ? Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "None selected",
                              style: TextStyle(color: Colors.black54),
                            ))
                        : Container(),
                  ],
                ),
              ),

              SizedBox(height: 40),
              //################################################################################################
              // MultiSelectDialogField with initial values
              //################################################################################################
              MultiSelectDialogField(
                onConfirm: (val) {
                  _selectedAnimals5 = val;
                },
                dialogWidth: MediaQuery.of(context).size.width * 0.7,
                items: _items,
                initialValue:
                    _selectedAnimals5, // setting the value of this in initState() to pre-select values.
              ),
            ],
          ),
        ),
      ),
    );
  }
}
