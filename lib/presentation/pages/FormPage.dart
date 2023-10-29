
import 'package:simplife/libraries.dart';

class FormPage extends StatefulWidget {
  final UserRepository userRepository;
  final String title;
  final String submitButtonText;

  FormPage({
    required this.userRepository,
    this.title = 'Form Page',
    this.submitButtonText = 'Submit',
  });

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<MyTextFieldState> _usernameKey = GlobalKey<MyTextFieldState>();
  final GlobalKey<MyCheckboxState> _rememberMeKey = GlobalKey<MyCheckboxState>();

  void _submitLoginForm(Map<String, dynamic> attributes) {
    final UserModel user = UserModel(attributes: attributes);
    try {
      widget.userRepository.login(user);
      // Provide feedback to the user about successful login
    } catch (error) {
      // Handle error and provide feedback to the user
      print('Login failed: \$error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
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
                    Map<String, dynamic> formData = {
                      'username': _usernameKey.currentState?.currentValue,
                      'rememberMe': _rememberMeKey.currentState?.currentValue,
                    };
                    _submitLoginForm(formData);
                  }
                },
                child: Text(widget.submitButtonText),
              )
            ],
          ),
        ),
      ),
    );
  }
}
