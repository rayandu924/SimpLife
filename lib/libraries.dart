library librairies;

//flutter
export 'package:flutter/material.dart';
export 'dart:convert';

export 'package:flutter_form_builder/flutter_form_builder.dart';


//presentation

//pages
export 'presentation/pages/LoginPage.dart';
//widgets
export 'presentation/widgets/forms/MyCheckbox.dart';
export 'presentation/widgets/forms/MyForm.dart';
export 'presentation/widgets/forms/MyTextField.dart';
export 'presentation/widgets/main/MyTile.dart';
export 'presentation/widgets/main/MyTileLayout.dart';
export 'presentation/widgets/forms/MyFormContainer.dart';
export 'presentation/widgets/LoginForm.dart';
//themes
export 'presentation/styles/MyColors.dart';
export 'presentation/styles/MyTextStyles.dart';
export 'presentation/styles/MyThemes.dart';
export 'presentation/styles/MyThemesData.dart';

//domain

//entities
export 'domain/entities/User.dart';
//repositoryInterfaces
export 'domain/repositoryInterfaces/UserRepository.dart';
//useCases
export 'domain/useCases/UserUseCases.dart';

//data

//dataSources
export 'data/dataSources/RemoteUserDataSource.dart';
export 'package:http/http.dart';
//models
export 'data/models/UserModel.dart';
//repositories
export 'data/repositories/UserRepositoryImpl.dart';

//utilities
export 'utilities/validator.dart';

