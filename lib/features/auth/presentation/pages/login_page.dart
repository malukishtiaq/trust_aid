import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_aid/core/router/nevigation.dart';
import 'package:trust_aid/core/theme/padding_theme.dart';
import 'package:trust_aid/core/utils/size_utils.dart';
import '../../../../core/common/widgets/base_background_screen.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/common/widgets/png_asset.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/auth_action_buttons.dart';
import '../widgets/auth_field.dart';
import '../widgets/custom_outlined_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseBackgroundScreen(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              context.navigate.home(context);
            } else if (state is AuthFailure) {
              showSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Theme.of(context).mediumPadding.v,
                    ),
                    PngAsset.logo(),
                    SizedBox(
                      height: Theme.of(context).largePadding.v,
                    ),
                    CustomOutlinedButton(
                      buttonText: 'Create account',
                      onPressed: () => {context.navigate.register(context)},
                    ),
                    SizedBox(
                      height: Theme.of(context).mediumPadding.v,
                    ),
                    AuthField(
                      hintText: 'Phone or email',
                      controller: _userNameController,
                    ),
                    SizedBox(
                      height: Theme.of(context).mediumPadding.v,
                    ),
                    AuthField(
                      hintText: 'Password',
                      controller: _passwordController,
                      isObscureText: true,
                    ),
                    SizedBox(
                      height: Theme.of(context).mediumPadding.v,
                    ),
                    AuthActionButtons(
                      buttonText: 'Sign In',
                      onPressed: () => {
                        BlocProvider.of<AuthBloc>(context).add(
                          const AuthLoginEvent(
                            email: 'malukishtiaq@gmail.com',
                            password: 'aaaaaaaa',
                            //_userNameController.text,
                            //_passwordController.text,
                          ),
                        )
                      },
                      forgotPasswordPressed: () =>
                          {context.navigate.forgotPassword(context)},
                    ),
                  ],
                ),
                if (state is AuthLoading) const Loader()
              ],
            );
          },
        ),
      ),
    );
  }
}
