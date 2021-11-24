import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../styles/color.dart';
import '../widgets/card/product_new_customer_card.dart';
import '../widgets/menu_btn.dart';
import '../widgets/wrapper.dart';

final menuListAssets = [
  {
    'imageUri': 'assets/category-icon/official-store.png',
    'label': 'Official Store'
  },
  {'imageUri': 'assets/category-icon/lihat-semua.png', 'label': 'Lihat Semua'},
  {
    'imageUri': 'assets/category-icon/rumah-tangga.png',
    'label': 'Rumah Tangga'
  },
  {'imageUri': 'assets/category-icon/topup.png', 'label': 'Top Up & Tagihan'},
  {'imageUri': 'assets/category-icon/elektronik.png', 'label': 'Elektronik'},
  {'imageUri': 'assets/category-icon/fashion.png', 'label': 'Fashion-Pria'},
  {'imageUri': 'assets/category-icon/keuangan.png', 'label': 'Keuangan'},
  {
    'imageUri': 'assets/category-icon/travel.png',
    'label': 'Travel & Entertainment'
  },
  {
    'imageUri': 'assets/category-icon/komputer-dan-laptop.png',
    'label': 'Komputer'
  },
];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _ColorAnimationController;
  late Animation _colorTween, _iconColorTween, _borderColor;

  @override
  void initState() {
    _ColorAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(_ColorAnimationController);
    _iconColorTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_ColorAnimationController);
    _borderColor = ColorTween(begin: Colors.transparent, end: Colors.grey)
        .animate(_ColorAnimationController);
    super.initState();
  }

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _ColorAnimationController.animateTo(scrollInfo.metrics.pixels / 20);
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AnimatedBuilder(
          animation: _ColorAnimationController,
          builder: (context, child) => AppBar(
            title: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Icon(
                      Icons.search,
                      size: 15,
                      color: Colors.grey,
                    ),
                    Text(
                      "Cari di Tokopedia",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    )
                  ],
                ),
              ),
            ),
            bottom: PreferredSize(
              child: Container(
                color: _borderColor.value,
                height: 0.3,
              ),
              preferredSize: const Size.fromHeight(1.0),
            ),
            backgroundColor: _colorTween.value, //TKPColor.primaryColor,
            elevation: 0,
            iconTheme: IconThemeData(color: _iconColorTween.value),
            actions: [
              ActionButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                onTap: () {},
                icon: const Icon(Icons.email_outlined),
              ),
              ActionButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                onTap: () {},
                icon: const Icon(Icons.notifications_outlined),
              ),
              ActionButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                onTap: () {},
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
              ActionButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                onTap: () {},
                icon: const Icon(Icons.menu),
              ),
            ],
          ),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: _scrollListener,
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    CustomPaint(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                      ),
                      painter: HeaderCurvedContainer(),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: kToolbarHeight * 2),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Dikirim ke ",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                  Text(
                                    "Rumah Yoghi Burnama",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 15,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              const SizedBox(height: 15)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width - 30,
                          child: Card(),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 90,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: menuListAssets
                                .map((e) => MenuBtn(
                                    label: e['label'],
                                    imageUri: e['imageUri']!))
                                .toList(),
                          ),
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            viewportFraction: 0.95,
                            aspectRatio: 50 / 16,
                            enableInfiniteScroll: false,
                          ),
                          items: [
                            "assets/carousel-slider/banner-1.webp",
                            "assets/carousel-slider/banner-2.webp"
                          ].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                      child: Image.asset(
                                        i,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 15.0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 90,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: menuListAssets
                                .map((e) => MenuBtn(
                                    label: e['label'],
                                    imageUri: e['imageUri']!))
                                .toList(),
                          ),
                        ),
                        Wrapper(
                          title: 'Khusus Pengguna Baru',
                          height: 246,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.green,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              children: const [
                                ProductNewCustomerCard(
                                  title: '',
                                  blankCard: true,
                                ),
                                ProductNewCustomerCard(
                                  title: 'Title',
                                  subTtitle: 'subtitle',
                                  secondSubTitle: 'secondSubtitle',
                                ),
                                ProductNewCustomerCard(
                                  title: 'test',
                                ),
                                ProductNewCustomerCard(
                                  title: 'test',
                                ),
                                ProductNewCustomerCard(
                                  title: 'test',
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Wrapper(
                          height: 200,
                          title: 'Promo Terbaru',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.padding,
  }) : super(key: key);

  final Function() onTap;
  final Widget icon;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(8.0),
      child: GestureDetector(onTap: onTap, child: icon),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = TKPColor.primaryColor;
    Path path = Path()
      ..relativeLineTo(0, 170)
      ..quadraticBezierTo(size.width / 2, 200.0, size.width, 170)
      ..relativeLineTo(0, -170)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
