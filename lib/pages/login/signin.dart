import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const horPadding = 20.0;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: horPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 44.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.all(Radius.circular(8)),
                ),
                child: buildFormBody(context),
              ),
              const SizedBox(height: 56),
            ],
          ),
        ),
      ),
    );
  }

  buildFormBody(BuildContext context) {
    const totalHorPadding = 20.0 + 16.0;
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              'Giris',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            //TODO text
            SizedBox(
              width: (MediaQuery.of(context).size.width -
                      (totalHorPadding * 2.0)) *
                  0.7,
              child: Text('Giriş üçin telefon belgiňizi we parolyňyzy giriziň'),
            ),
            const SizedBox(height: 64),
            TextFormField(
              // controller: phoneController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: 'Telefon nomer',
                hintText: 'Example: 12345',
                helperText: '',
                // errorText: phoneError,
              ),
              // onFieldSubmitted: (v) => onSubmitTap(runMutation),
              // validator: validateOtp,
              // onChanged: (v) {
              //   if (otpError != null) {
              //     setState(() => otpError = null);
              //   }
              // },
              // onSaved: (v) => savedOtp = v,
            ),
          ],
        ));
  }
}
