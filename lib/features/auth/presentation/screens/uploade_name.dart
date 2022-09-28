import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth_cubit/auth_cubit.dart';

import '../../../../core/widgets/error_widget.dart';

class NameUploadingScreen extends StatefulWidget {
  const NameUploadingScreen({super.key});

  @override
  State<NameUploadingScreen> createState() => _NameUploadingScreenState();
}

class _NameUploadingScreenState extends State<NameUploadingScreen> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text("[  Your Fucking Name ]"),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'enter your name',
                    hintStyle: TextStyle(fontSize: 14),
                  )),
              const Divider(thickness: 1),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: () {
                    print("got pressed");

                    BlocProvider.of<AuthCubit>(context)
                        .uploadeUserName(nameController.text);
                  },
                  child: const Text("upload name")),
              const Divider(thickness: 1),
            ],
          ),
        );
      },
    ));
  }
}
