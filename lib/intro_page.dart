import 'package:flutter/material.dart';

import 'class_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  static const String id = "intro_page";

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController controller = PageController(initialPage: 0);

  int sellectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          (sellectedIndex != 2)
              ? TextButton(
                  onPressed: () {
                    setState(() {
                      sellectedIndex = 2;
                    });
                    controller.animateToPage(sellectedIndex,
                        duration: Duration(milliseconds: 350),
                        curve: Curves.easeIn);
                  },
                  child: const Text("Skip",
                      style: TextStyle(color: Colors.red, fontSize: 17)))
              : TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.red, fontSize: 17),
                  ))
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                sellectedIndex = index;
              });
            },
            children: [
              makePage(
                  image: "asset/images/image.png",
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent),
              makePage(
                  image: "asset/images/im_2.png",
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent),
              makePage(
                  image: "asset/images/im_3.png",
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent)
            ],
          ),
          //#indicator
          indicator(),
        ],
      ),
    );
  }

  Widget makePage({required String image, required title, required content}) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          // #image
          Expanded(
              child: Container(
            alignment: Alignment.bottomCenter,
            child: Image(
              height: 250,
              width: 250,
              image: AssetImage(image),
            ),
          )),
          const SizedBox(
            height: 30,
          ),
          //#title #content
          Expanded(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 22,
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget elementOfIndicator(int index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 10),
      height: 6,
      width: (index == sellectedIndex) ? 20 : 6,
      duration: Duration(milliseconds: 350),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(3)),
    );
  }

  Widget indicator() {
    return Container(
      padding: EdgeInsets.only(bottom: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          elementOfIndicator(0),
          elementOfIndicator(1),
          elementOfIndicator(2),
        ],
      ),
    );
  }
}
