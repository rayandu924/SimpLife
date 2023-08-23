import 'package:simplife/global.dart';

class HomeView extends StatelessWidget {
  final HomeModel model;
  
  HomeView({required this.model});
  
  @override
  Widget build(BuildContext context) {
    //fetchData(); after build the home helped by the data fetched

    return Scaffold(
      appBar: AppBar(title: Text('Accueil')),
      body: Center(
        child: Column(
          children: [
            custom_form(fields: [
              FieldModel(
                name: 'Nom',
                type: 'TextField',
                isRequired: true,
              ),
              FieldModel(
                name: 'Email',
                type: 'TextField',
                isRequired: true,
              ),
              FieldModel(
                name: 'Mot de passe',
                type: 'TextField',
                isRequired: true,
              ),
              FieldModel(
                name: 'varvalidatecondition',
                title: 'J\'accepte les conditions',
                type: 'Checkbox',
                isRequired: true,
              ),
            ], onSubmit: (formData) {
              print(formData);
            }),
          ],
        ),
      ),
    );
  }
}
