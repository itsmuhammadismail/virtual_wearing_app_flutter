part of '../signup_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      child: SafeArea(
        child: Form(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 90),
                SvgPicture.asset(
                  'assets/logos/virtual_wearing.svg',
                  height: 60,
                ),
                const Spacer(),
                TextFieldContainer(
                  child: MyTextField(
                    // controller: usernameController,
                    icon: const Icon(Icons.person),
                    hintText: 'Username',
                    onChange: (value) {},
                    required: true,
                  ),
                ),
                const SizedBox(height: 20),
                TextFieldContainer(
                  child: MyTextField(
                    // controller: usernameController,
                    icon: const Icon(Icons.mail),
                    hintText: 'Email Address',
                    onChange: (value) {},
                    required: true,
                  ),
                ),
                const SizedBox(height: 20),
                TextFieldContainer(
                  child: MyTextField(
                    // controller: passwordController,
                    icon: const Icon(Icons.lock),
                    hintText: 'Password',
                    obscureText: true,
                    onChange: (value) {},
                    required: true,
                  ),
                ),
                const SizedBox(height: 20),
                TextFieldContainer(
                  child: MyTextField(
                    // controller: passwordController,
                    icon: const Icon(Icons.lock),
                    hintText: 'Confirm Password',
                    obscureText: true,
                    onChange: (value) {},
                    required: true,
                  ),
                ),
                const SizedBox(height: 20),
                TextFieldContainer(
                  child: PrimaryButton(
                    child: const WhiteText('Signup'),
                    onPressed: () => Navigate.to(context, LoginScreen.id),
                  ),
                ),
                const Spacer(),
                const SizedBox(height: 20),
                const Text(
                  'Already have an account',
                  style: kBody2,
                ),
                const SizedBox(height: 20),
                TextFieldContainer(
                    child: SecondaryButton(
                  child: const Text('Login'),
                  onPressed: () => Navigate.to(context, LoginScreen.id),
                )),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
