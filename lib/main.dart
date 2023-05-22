import 'package:flutter/material.dart';

/// Flutter code sample for [Form].

void main() => runApp(const FormExampleApp());

class FormExampleApp extends StatelessWidget {
  const FormExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FormExample(),
      ),
    );
  }
}

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              'FORMULARIO PERSONAL',
              style: TextStyle(
                fontSize: 30.0,
                color: Color.fromARGB(255, 136, 102, 2),
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 925),
              child: Text('Nombre:')),
          Padding(
              padding: const EdgeInsets.only(top: 0, left: 20, right: 925),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Ingrese su nombre',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              )),
          const Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 925),
              child: Text('Apellido:')),
          Padding(
              padding: const EdgeInsets.only(top: 0, left: 20, right: 925),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Ingrese su Apellido',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              )),
          const Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 925),
              child: Text('Direccion:')),
          Padding(
              padding: const EdgeInsets.only(top: 0, left: 20, right: 925),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Ingrese su direccion de domicilio',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              )),
          const Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 925),
              child: Text('Genero')),
          const SizedBox(
            child: RadioF(),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 925),
              child: Text('')),
          const SizedBox(
            child: CheckboxF(),
          ),
          
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 925),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

//RADIOBOX------------------------------------------------------------------

enum SingingCharacter { masculino, femenino }

class RadioF extends StatefulWidget {
  const RadioF({super.key});

  @override
  State<RadioF> createState() => _RadioFState();
}

class _RadioFState extends State<RadioF> {
  SingingCharacter? _character = SingingCharacter.masculino;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Masculino'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.masculino,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Femenino'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.femenino,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('No definido'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.femenino,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

//CHECKBOX--------------------------------------------------------------

class CheckboxF extends StatefulWidget {
  const CheckboxF({super.key});

  @override
  State<CheckboxF> createState() => _CheckboxFState();
}

class _CheckboxFState extends State<CheckboxF> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return const Color.fromARGB(255, 33, 243, 37);
      }
      return const Color.fromARGB(255, 54, 124, 244);
    }

    const Text('HOLA');

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
