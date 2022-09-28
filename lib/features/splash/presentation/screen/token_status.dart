import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/token_cubit.dart';

import '../../../../core/widgets/error_widget.dart';

class TokenStatus extends StatefulWidget {
  const TokenStatus({super.key});

  @override
  State<TokenStatus> createState() => _TokenStatusState();
}

class _TokenStatusState extends State<TokenStatus> {
  @override
  Widget build(BuildContext context) {
    var cc = BlocProvider.of<TokenCubit>(context).verifyTokenStatus();
    print("nnnnnnnnnnnnnnn $cc");

    return Scaffold(body: BlocBuilder<TokenCubit, TokenState>(
      builder: (context, state) {
        if (state is TokenLoading) {
          return Container(
            padding: const EdgeInsets.all(25),
            child: const Center(
                child: CircularProgressIndicator(color: Colors.black)),
          );
        } else if (state is TokenLoaded) {
          if (state.tokenVerification.success == true) {
            // setState(() {
            //   //    Navigator.of(context).pushNamed(Routes.homeTestRoute);
            // });
            // } else if (state.tokenVerification.success == false) {
            //   setState(() {
            //     //   Navigator.of(context).pushNamed(Routes.phoneTestRoute);
            //   });
          }
          return Text(state.tokenVerification.message);
        } else if (state is TokenError) {
          return const XxErrorWidget();
        }
        return Container(
          padding: const EdgeInsets.all(25),
          child:
              const Center(child: CircularProgressIndicator(color: Colors.red)),
        );
      },
    ));
  }
}
