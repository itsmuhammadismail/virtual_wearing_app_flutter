part of '../home_screen.dart';

class Body extends HookWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedButton = useState('men');
    final search = useState('');
    late final List<Product> product;

    void fetchProducts() async {
      await context.read<ProductsCubit>().get();
    }

    useEffect(() {
      fetchProducts();
      return null;
    }, []);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          const Text(
            'Welcome',
            style: TextStyle(
              color: Color.fromARGB(153, 17, 17, 19),
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 15),
          const SizedBox(
            width: 270,
            child: Text(
              'What are you looking for today!',
              style: kHeading2,
            ),
          ),
          const SizedBox(height: 25),
          MyTextField(
            hintText: 'Search',
            required: false,
            icon: const Icon(Icons.search),
            onChange: (value) {
              search.value = value;
            },
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                child: selectedButton.value == 'men'
                    ? PrimaryButton(
                        child: const WhiteText('Men'),
                        onPressed: () => selectedButton.value = 'men')
                    : SecondaryButton(
                        child: const Text('Men'),
                        onPressed: () => selectedButton.value = 'men'),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: selectedButton.value == 'women'
                    ? PrimaryButton(
                        child: const WhiteText('Women'),
                        onPressed: () => selectedButton.value = 'women')
                    : SecondaryButton(
                        child: const Text('Women'),
                        onPressed: () => selectedButton.value = 'women'),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: selectedButton.value == 'kid'
                    ? PrimaryButton(
                        child: const WhiteText('Kids'),
                        onPressed: () => selectedButton.value = 'kid')
                    : SecondaryButton(
                        child: const Text('Kids'),
                        onPressed: () => selectedButton.value = 'kid'),
              ),
            ],
          ),
          const SizedBox(height: 25),
          ProductsGrid(category: selectedButton.value, search: search.value),
        ],
      ),
    );
  }
}
