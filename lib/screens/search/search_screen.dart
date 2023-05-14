import 'package:flutter/material.dart';
import 'package:riverpod_demo_app/screens/home/home_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? enteredText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: const Text(
          "CoinRich",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xff363333),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xff747474),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    enteredText = value;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                if (enteredText == null || enteredText == '') {
                  const snackBar = SnackBar(
                    content: Text('Please enter some data to continue'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return;
                }
                final enteredData = enteredText?.replaceAll(' ', '');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomePage(
                      params: enteredData!,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(
                      0xfffae000,
                    ),
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Search",
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
