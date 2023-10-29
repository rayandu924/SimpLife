import 'package:simplife/libraries.dart';
class FormPage extends StatefulWidget {
  final UserRepository userRepository;

  FormPage({required this.userRepository});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<MyTextFieldState> _usernameKey = GlobalKey<MyTextFieldState>();
  final GlobalKey<MyCheckboxState> _rememberMeKey = GlobalKey<MyCheckboxState>();

  void _submitLoginForm(Map<String, dynamic> attributes) {
    final UserModel user = UserModel(attributes: attributes);
    widget.userRepository.login(user);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MyTextField(
                key: _usernameKey,
                fieldModel: FormFieldModel(
                  name: "username",
                  title: "Username",
                  fieldType: FormFieldEnum.TEXT,
                  initialValue: '',
                  additionalAttributes: {},
                ),
              ),
              MyCheckbox(
                key: _rememberMeKey,
                fieldModel: FormFieldModel(
                  name: "rememberMe",
                  title: "Remember Me",
                  fieldType: FormFieldEnum.CHECKBOX,
                  initialValue: false,
                  additionalAttributes: {},
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Logic to get the form data
                    Map<String, dynamic> formData = {};  // Placeholder for form data
                    _formKey.currentState?.save();
                    formData['username'] = _usernameKey.currentState?.currentValue;
                    formData['rememberMe'] = _rememberMeKey.currentState?.currentValue;
                    print(formData);
                    _submitLoginForm(formData);
                  }
                },
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}