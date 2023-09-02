import 'package:simplife/global.dart';

class HomeView extends StatelessWidget {
  final HomeModel model;

  HomeView({required this.model});

  @override
  Widget build(BuildContext context) {

    final List<FieldModel> sampleFields = [
      FieldModel(
          name: 'username',
          title: 'Username',
          type: 'TextField',
          fieldModel: TextFieldModel(
              colorTitle: ValueNotifier<Color>(Colors.white),
              colorBorder: ValueNotifier<Color>(Colors.white),
              validator: ValidatorEmail,),
          initialValue : 'test',
          onChanged: onChangedTextFormField,
      ),
      FieldModel(
          name: 'acceptTerms',
          title: 'Accept Terms & Conditionsssssssssssssssssssss',
          type: 'Checkbox',
          fieldModel: CheckboxModel(
              colorTitle: ValueNotifier<Color>(Colors.red),
                        validator: ValidatorCheckbox,
          ),
          initialValue : false,
          onChanged: onChangedCheckbox,),
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Accueil')),
      body: Column(children: [
        Expanded(
            child: CustomTileLayout(
          tile: const custom_tile(
            backgroundColor: Color.fromARGB(255, 81, 0, 255),
          ),
          topLeft: const Text('Top Left', style: tileTitle),
          center:custom_form(
          fields: sampleFields,
          onSubmit: (formData) {
            print(formData);
          },)
        )),
      ]),
    );
  }
}
