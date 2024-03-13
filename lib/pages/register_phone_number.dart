import 'package:flutter/material.dart';
import 'package:training_with_flutter/pages/selection_city.dart';
import 'package:training_with_flutter/utils/AssetsUtils.dart';

class RegisterPhoneNumber extends StatelessWidget {
  RegisterPhoneNumber({required key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            // mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _toolbarTop(context),
              _descriptionTop(context),
              _phoneNumberInputBody(context),
              // _phoneNumberInputBody(context),
            ]),
      ),
    );
  }

  Widget _toolbarTop(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(SelectionCity.PADDING_PRIMARY_VIEW),
      child: Icon(
        Icons.clear,
      ),
    );
  }

  Widget _descriptionTop(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            height: 60,
            child: Image(
              image: AssetImage(
                AssetsUtils.ICON_VERIFICATION_PHONE_NUMBER,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: Text(
              'Enter your mobile number we will send you the OTP to verify later',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  Widget _phoneNumberInputBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: Center(
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _phoneNumberInputCard(
                          context, '+51', 3, (textChanged) {}),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: _phoneNumberInputCard(
                            context, '989678931', 9, (textChanged) {}),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor,
                      ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _phoneNumberInputCard(
      BuildContext context, String hintText, int maxLength, Function function) {
    var mediaQuery = MediaQuery.of(context);
    var widthInput = mediaQuery.size.width * 0.8;
    return Container(
      width: 60,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            5.0,
          ),
        ),
        border: Border.all(
          color: Colors.grey[300]!,
        ),
      ),
      child: TextField(
        textAlign: TextAlign.left,
        decoration: new InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          counterText: "",
        ),
        textInputAction: TextInputAction.done,
        maxLength: maxLength,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        onChanged: (data) => function(data),
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
