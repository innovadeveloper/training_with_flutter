import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training_with_flutter/model/onboarding_model.dart';
import 'package:training_with_flutter/utils/AssetsUtils.dart';

class Login extends StatelessWidget {

  Login({required key}) : super(key: key);

  static const ROUND_PRIMARY_VIEW = 20.0; // TEXTFIELD, CARD

  /*
   * retorna el tamanio total de la pantalla sin considerar el tamanio del appbar y
   * la barra de notificaciones o notch..
   */
  double _screenTotalSize(
      ObstructingPreferredSizeWidget appBar, MediaQueryData mediaQueryData) {
    return (mediaQueryData.size.height -
        appBar.preferredSize.height -
        mediaQueryData.padding.top);
  }

  /*
   * retorna el tamanio total de la pantalla sin considerar el tamanio del
   * la barra de notificaciones o notch..
   */
  double _screenTotalSizeWithoutAppBar(MediaQueryData mediaQueryData) {
    return (mediaQueryData.size.height - mediaQueryData.padding.top);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    // var isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      body: Column(
        children: <Widget>[
          _backgroundTop(context),
          _loginButtonsBody(context),
          // Container(
          //   child: Text(
          //     'Login',
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _backgroundTop(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var heightBackground = _screenTotalSizeWithoutAppBar(mediaQuery) * 0.5;
    const photoWidthCut = 200.0; // space of cutted
    var widthBackground = mediaQuery.size.width;

    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(Login.ROUND_PRIMARY_VIEW),
        bottomRight: Radius.circular(Login.ROUND_PRIMARY_VIEW),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: photoWidthCut * -1,
            child: Image(
              image: AssetImage(
                AssetsUtils.BG_PHOTO_DOCTOR,
              ),
              fit: BoxFit.cover,
              height: heightBackground,
              width: widthBackground + photoWidthCut,
            ),
          ),
          Container(
            width: double.infinity,
            height: heightBackground,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.8),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Login.ROUND_PRIMARY_VIEW),
                bottomRight: Radius.circular(Login.ROUND_PRIMARY_VIEW),
              ),
            ),
          ),
          Container(
            height: heightBackground,
            child: Center(
              child: Text(
                'MEDIC',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _loginButtonsBody(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var heightBackground = _screenTotalSizeWithoutAppBar(mediaQuery) * 0.5;

    return Container(
      height: heightBackground,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          _buttonLogin(
            context,
            Colors.black,
            'Mobile number',
            () {},
          ),
          SizedBox(
            height: 10,
          ),
          _buttonLogin(
            context,
            Colors.blue,
            'Facebook',
            () {},
          ),
          SizedBox(
            height: 10,
          ),
          _buttonLogin(
            context,
            Colors.red,
            'Google',
            () {},
          ),
          Expanded(
            child: Container(),
          ),
          Text(
            'By continuing, you agree to Terms & Conditions',
            style: Theme.of(context)
                .textTheme
                .headline6
                !.copyWith(color: Colors.grey, fontSize: 11),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _buttonLogin(
      BuildContext context, Color color, String loginText, Function function) {
    var mediaQuery = MediaQuery.of(context);
    var widthInput = mediaQuery.size.width * 0.8;
    return Container(
      width: widthInput,
      child: OutlinedButton(
        onPressed: () => function(),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(color),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
              color: Colors.grey[300]!,
            ),
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        child: Text(loginText),
      ),
    );
  }
}
