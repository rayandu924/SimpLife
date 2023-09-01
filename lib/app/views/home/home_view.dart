import 'package:simplife/app/utils/converters/fl_spot.dart';
import 'package:simplife/global.dart';

class HomeView extends StatelessWidget {
  final HomeModel model;

  HomeView({required this.model});

  @override
  Widget build(BuildContext context) {
    //fetchData(); after build the home helped by the data fetched
    Map<String, Object> data = model.fetchData();
    List<FlSpot> spots = convertStringToFlSpots(data['spots'] as String);

    final List<FieldModel> sampleFields = [
    FieldModel(name: 'username', title: 'Username', type: 'TextField', isRequired: true, validator: emailValidator),
    FieldModel(name: 'Karim', title: 'Karim', type: 'TextField', isRequired: false),
    FieldModel(name: 'acceptTerms', title: 'Accept Terms & Conditions', type: 'Checkbox', isRequired: true),
  ];

    return Scaffold(
      appBar: AppBar(title: Text('Accueil')),
      body: Column(
        children: [
          Expanded(
              child:custom_form(
          fields: sampleFields,
          onSubmit: (formData) {
            print(formData);
          },)),
        ]
      ),
    );
  }
}
