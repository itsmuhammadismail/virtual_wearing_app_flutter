part of '../login_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void _onSuccess() => Navigate.to(context, HomeScreen.id);

    void _onSubmit(VoidCallback onSuccess) async {
      final form = formKey.currentState;

      if (form!.validate()) {
        FocusManager.instance.primaryFocus?.unfocus();
        if (usernameController.text != '' && passwordController.text != '') {
          await context
              .read<UserCubit>()
              .login(usernameController.text, passwordController.text);
          UserStatus status = context.read<UserCubit>().state.status;
          if (status == UserStatus.error) {
            usernameController.clear();
            passwordController.clear();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const Alert(
                  heading: 'Login Failed!',
                  body: 'Username or Password is incorrect',
                );
              },
            );
          } else {
            onSuccess.call();
          }
          form.save();
        }
      } else {}
    }

    return SizedBox(
      height: size.height,
      child: SafeArea(
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 90),
                SvgPicture.asset(
                  'assets/logos/virtual_wearing.svg',
                  height: 60,
                ),
                Spacer(),
                TextFieldContainer(
                  child: MyTextField(
                    controller: usernameController,
                    icon: const Icon(Icons.mail),
                    hintText: 'Email Address',
                    onChange: (value) {},
                    required: true,
                  ),
                ),
                const SizedBox(height: 20),
                TextFieldContainer(
                  child: MyTextField(
                    controller: passwordController,
                    icon: const Icon(Icons.lock),
                    hintText: 'Password',
                    obscureText: true,
                    onChange: (value) {},
                    required: true,
                  ),
                ),
                const SizedBox(height: 20),
                TextFieldContainer(
                  child: PrimaryButton(
                    child: context.watch<UserCubit>().state.status ==
                            UserStatus.loading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const WhiteText('Login'),
                    onPressed: () => _onSubmit(_onSuccess),
                  ),
                ),
                Spacer(),
                const SizedBox(height: 20),
                Text(
                  'Don’t have an account',
                  style: kBody2,
                ),
                const SizedBox(height: 20),
                TextFieldContainer(
                    child: SecondaryButton(
                  child: Text('Sign up'),
                  onPressed: () => Navigate.to(context, SignupScreen.id),
                )),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
