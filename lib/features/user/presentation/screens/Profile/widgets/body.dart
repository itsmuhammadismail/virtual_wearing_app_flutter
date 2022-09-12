part of '../profile_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              child: Icon(
                Icons.person,
                size: 48,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            TextFieldContainer(
                child: MyTextField(
              hintText: "Muhammad Ismail",
              disabled: true,
              icon: const Icon(Icons.person),
              onChange: (value) {},
            )),
            const SizedBox(height: 20),
            TextFieldContainer(
                child: MyTextField(
              hintText: "ismail@gmail.com",
              disabled: true,
              icon: const Icon(Icons.mail),
              onChange: (value) {},
            )),
            const SizedBox(height: 20),
            TextFieldContainer(
                child: PrimaryButton(
                    child: const WhiteText('Logout'),
                    onPressed: () {
                      context.read<UserCubit>().logout();
                      Navigate.to(context, LoginScreen.id);
                    })),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
