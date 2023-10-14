import 'package:csse/providers/user_provider.dart';
import 'package:csse/services/local_prefs.dart';
import 'package:csse/utils/constants.dart';
import 'package:csse/utils/index.dart';
import 'package:csse/views/auth/auth_checker.dart';
import 'package:csse/widgets/input_field.dart';
import 'package:csse/widgets/main_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late UserProvider userProvider;
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  void initState() {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    setState(() {
      name.text = userProvider.user?.name ?? '';
      email.text = userProvider.user?.email ?? '';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
        actions: [
          MaterialButton(
            onPressed: () async {
              LocalPreferences.instance.clearePrefs();
              await FirebaseAuth.instance.signOut();
              context.navigator(context, AuthChecker());
            },
            child: const Text("Logout"),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(defaultPadding),
              children: [
                CustomInputField(
                  label: 'Email',
                  hint: 'Email',
                  controller: email,
                  disabled: false,
                ),
                CustomInputField(
                  label: 'Name',
                  hint: 'Name',
                  controller: name,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: MainButton(
              onPressed: () {},
              title: 'Update',
            ),
          )
        ],
      ),
    );
  }
}
