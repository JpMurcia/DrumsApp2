import 'package:drumsapp2/src/controllers/signUp_controller.dart';
import 'package:drumsapp2/src/pages/login_page.dart';
import 'package:drumsapp2/src/utils/colors_utils.dart';
import 'package:drumsapp2/src/utils/textStyle_utils.dart';
import 'package:drumsapp2/src/widgets/buttons.dart';
import 'package:drumsapp2/src/widgets/customAppBar.dart';

// import 'package:drumsapp2/src/widgets/inputs.dart';
import 'package:drumsapp2/src/widgets/inputsSignUp.dart';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
        init: SignUpController(),
        builder: (_) => Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
                children: <Widget>[
                  customAppBar('Registro', context),
                  _singUpForm(context)
                ],
              ),
            ));
  }

  Widget _singUpForm(BuildContext context) {
    // final bloc = Provider.ofS(context);
    final size = MediaQuery.of(context).size;

    return GetBuilder<SignUpController>(
        init: SignUpController(),
        builder: (_) => SingleChildScrollView(
                child: Column(children: <Widget>[
              SafeArea(
                child: Container(
                  height: 80.0,
                ),
              ),
              Container(
                width: size.width,
                margin: EdgeInsets.only(top: size.height * 0.23),
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 5.0),
                    mailInput(),
                    SizedBox(height: 20.0),
                    passwordInput(),
                    SizedBox(height: 30.0),
                    passwordConfimationInput(),
                    SizedBox(height: 20.0),
                    authCustomRaisedButton('Registrarse'),
                    SizedBox(height: 20.0),
                    _accountCreated(context),
                  ],
                ),
              ),
            ])));
  }

  Widget _accountCreated(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '¿Ya tiene una cuenta?',
          style: textStyleShortBlack,
        ),
        textButton('Iniciar sesión', blue2Color, context, LoginPage()),
      ],
    );
  }
}
