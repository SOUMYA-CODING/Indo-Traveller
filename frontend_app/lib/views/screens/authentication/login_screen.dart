import 'package:flutter/material.dart';
import 'package:frontend_app/constants/color.dart';
import 'package:frontend_app/constants/extension.dart';
import 'package:frontend_app/views/widgets/common/custom_button.dart';
import 'package:frontend_app/views/widgets/common/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0.hp, horizontal: 7.0.wp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .merge(const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),
              CustomAppTextFormField(
                hintText: "E-mail",
                isObscureText: false,
                textInputType: TextInputType.emailAddress,
                outlineBorderRequired: false,
                prefixIcon: Icons.home,
                validator: (value) {
                  if (value == "") {
                    return 'Please enter your email!';
                  }
                  return null;
                },
              ),
              CustomAppTextFormField(
                hintText: "Password",
                isObscureText: true,
                textInputType: TextInputType.visiblePassword,
                outlineBorderRequired: false,
                prefixIcon: Icons.home,
                suffixIcon: Icons.home,
                validator: (value) {
                  if (value == "") {
                    return 'Please enter your password!';
                  }
                  return null;
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0.hp),
                  child: InkWell(
                    onTap: (){},
                    child: Text(
                      "Password Reset ?",
                      style: Theme.of(context).textTheme.titleMedium!.merge(
                          const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
              CustomAppButton(
                content: Text(
                  "Sign In",
                  style: Theme.of(context).textTheme.titleMedium!.merge(
                      const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                onPressed: () {},
                outlineBorderRequired: true,
                backgroundColor: AppColor.primary,
              ),
              CustomAppButton(
                content: Text(
                  "Sign In with Google",
                  style: Theme.of(context).textTheme.titleMedium!.merge(
                      const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ),
                onPressed: () {},
                outlineBorderRequired: false,
                backgroundColor: Colors.white,
              ),
              CustomAppButton(
                content: Text(
                  "Dont have a account! Register",
                  style: Theme.of(context).textTheme.titleMedium!.merge(
                      const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ),
                onPressed: () {},
                outlineBorderRequired: true,
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
