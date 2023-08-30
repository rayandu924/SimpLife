import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter FormBuilder Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormExample(),
    );
  }
}

class FormExample extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FormBuilder Exemple')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // Checkbox avec texte à droite
              FormBuilderCheckbox(
                name: 'accept_terms',
                title: Text('J\'accepte les termes et conditions'),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),

              // TextField avec un trait en dessous
              FormBuilderTextField(
                name: 'username',
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Nom d\'utilisateur',
                ),
              ),

              SizedBox(height: 20),
              
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print(_formKey.currentState!.value);
                  }
                },
                child: Text('Soumettre'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
