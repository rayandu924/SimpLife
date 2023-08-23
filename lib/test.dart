import 'package:simplife/global.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulaire Simple',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SimpleForm(),
    );
  }
}

class SimpleForm extends StatefulWidget {
  @override
  _SimpleFormState createState() => _SimpleFormState();
}

class _SimpleFormState extends State<SimpleForm> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulaire Simple'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildFormRow("Nom", TextInputType.text, (value) {
                _formData['Nom'] = value;
              }),
              _buildFormRow("Age", TextInputType.number, (value) {
                _formData['Age'] = int.tryParse(value ?? "0");
              }),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print(_formData);  // Affiche les données du formulaire
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

  Widget _buildFormRow(String label, TextInputType type, FormFieldSetter<String> onSaved) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(label),
          ),
          Expanded(
            flex: 2,
            child: TextFormField(
              keyboardType: type,
              onSaved: onSaved,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez remplir ce champ';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Entrez $label',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
