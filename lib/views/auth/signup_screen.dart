import 'package:csse/utils/constants.dart';
import 'package:csse/widgets/input_field.dart';
import 'package:csse/widgets/main_button.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isSupplier = false;
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        reverse: true,
        child: Column(
          children: [
            Image.asset("assets/logo.jpg"),
            DefaultTextStyle(
              style: const TextStyle(
                color: primaryColor,
                fontSize: 24,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  rolePickerButton(
                    () {
                      setState(() {
                        isSupplier = !isSupplier;
                      });
                    },
                    "Manager",
                    !isSupplier,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    width: 2,
                    height: 27,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  rolePickerButton(() {
                    setState(() {
                      isSupplier = !isSupplier;
                    });
                  }, "Supplier", isSupplier),
                ],
              ),
            ),
            CustomInputField(
              label: "Name",
              hint: "Name",
              controller: name,
            ),
            CustomInputField(
              label: "Email",
              hint: "Email",
              controller: email,
            ),
            CustomInputField(
              label: "Password",
              hint: "Password",
              controller: password,
              isPassword: true,
            ),
            MainButton(
              onPressed: () {},
              title: "Signup",
            ),
          ],
        ),
      ),
    );
  }

  InkWell rolePickerButton(VoidCallback onTap, String title, bool shouldShow) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          border: !shouldShow
              ? const Border(
                  bottom: BorderSide(
                  color: primaryColor,
                  width: 2,
                ))
              : null,
        ),
        duration: defaultDuration,
        child: Text(
          title,
        ),
      ),
    );
  }
}
