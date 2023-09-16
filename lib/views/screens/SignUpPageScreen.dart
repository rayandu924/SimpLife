import 'package:simplife/librairies.dart';

class SignUpPageView extends StatefulWidget {
  @override
  _SignUpPageViewState createState() => _SignUpPageViewState();
}

class _SignUpPageViewState extends State<SignUpPageView> {
  
  // Create an instance of SignUpModel
  final SignUpPageModel _signUpModel = SignUpPageModel();

  @override
  Widget build(BuildContext context) {
    CustomForm customForm = CustomForm (
                  fields: _signUpModel.signUpFormFieldModel,
                  onSubmit: _signUpModel.handleFormSubmit,
                );

    return Scaffold(
      body:Center(child: CustomTileLayout(
                tile: const CustomTile (
                  backgroundColor: Color.fromARGB(255, 13, 11, 58),
                  wrapChild: true,
                ),
                topRight: const Text('SignUp', style: tileTitle),
                center: customForm,
                bottomCenter: ElevatedButton(
                  onPressed: () {
                     customForm.buttonCallback();
                  },
                  child: Text('Submit'),
                ),
                contentMargin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              ),),
    );
  }
}
