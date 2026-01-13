import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc/auth_bloc.dart';
import '../bloc/slider_bloc/slider_bloc.dart';
import '../domain/sliders_entity.dart';
import '../domain/user_profile_entity.dart';
import '../utils/apputils.dart';
import '../utils/native_notification.dart';
import '../utils/nativescanner.dart';
import '../web/api_credentials.dart';

import 'foodmenu.dart';
import 'notifications.dart';
import 'profile.dart';
import 'wallet_page.dart';
import 'sendmoney.dart';
import 'referal_page.dart';
import 'comingsoon.dart';

class CafeHomePage extends StatefulWidget {
  const CafeHomePage({Key? key}) : super(key: key);

  @override
  State<CafeHomePage> createState() => _CafeHomePageState();
}

class _CafeHomePageState extends State<CafeHomePage> {
  int currentIndex = 0;
  String walletBalance = "0.00";
  List<SlidersData> sliderData = [];

  @override
  void initState() {
    super.initState();

    NativeNotification.show(
      title: "KLJ Cafe ☕",
      message: "Welcome back!",
    );

    BlocProvider.of<SliderBloc>(context).add(FetchSliders());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width >= 600;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: _buildAppBar(isTablet),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          children: [
            _buildSlider(size),
            const SizedBox(height: 16),
            _buildIndicator(),
            const SizedBox(height: 24),
            _buildGrid(isTablet),
            const SizedBox(height: 16),
            _buildReferralButton(size),
          ],
        ),
      ),
    );
  }

  /* ---------------- APP BAR ---------------- */

  AppBar _buildAppBar(bool isTablet) {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      title: Text(
        "KLJ Cafe",
        style: TextStyle(
          fontSize: isTablet ? 28 : 22,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => NotificationScreen()),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.person, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => Profile()),
            );
          },
        ),
      ],
    );
  }

  /* ---------------- SLIDER ---------------- */

  Widget _buildSlider(Size size) {
    return BlocConsumer<SliderBloc, SliderState>(
      listener: (context, state) {
        if (state is SliderSuccess && state.cafeMenuEntity.status == 1) {
          setState(() {
            sliderData = state.cafeMenuEntity.data!;
          });
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: size.height * 0.28,
          child: PageView.builder(
            itemCount: sliderData.length,
            onPageChanged: (i) => setState(() => currentIndex = i),
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    APICredentials.sliderimageurl +
                        sliderData[index].image!,
                    fit: BoxFit.cover,
                    loadingBuilder: (_, child, progress) =>
                    progress == null
                        ? child
                        : const Center(child: CircularProgressIndicator()),
                    errorBuilder: (_, __, ___) =>
                    const Icon(Icons.image, size: 60),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        sliderData.length,
            (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index
                ? Colors.brown
                : Colors.grey.shade400,
          ),
        ),
      ),
    );
  }

  /* ---------------- GRID ---------------- */

  Widget _buildGrid(bool isTablet) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: isTablet ? 4 : 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: isTablet ? 1.3 : 1,
        children: [
          _buildCard("Wallet", Icons.account_balance_wallet),
          _buildCard("Menu", Icons.restaurant_menu),
          _buildCard("Scan QR", Icons.qr_code_scanner),
          _buildCard("Create Order", Icons.shopping_cart),
        ],
      ),
    );
  }

  Widget _buildCard(String title, IconData icon) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () async => _handleNavigation(title),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(2, 2),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: width * 0.09),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: width * 0.04,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (title == "Wallet")
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  "₹ $walletBalance",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  /* ---------------- REFERRAL ---------------- */

  Widget _buildReferralButton(Size size) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, size.height * 0.07),
          backgroundColor: Colors.redAccent,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ReferEarnPage()),
          );
        },
        child: const Text(
          "Referrals",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  /* ---------------- NAVIGATION ---------------- */

  Future<void> _handleNavigation(String title) async {
    if (title == "Menu") {
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => FoodMenuPage()));
    } else if (title == "Wallet") {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => WalletPage()));
    } else if (title == "Create Order") {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => Comingsoon(title: "")));
    } else if (title == "Scan QR") {
      String? result = await NativeQRScanner.openScanner();
      if (result != null) {
        BlocProvider.of<AuthBloc>(context)
            .add(DecryptQrEvent(result));
      }
    }
  }

  Future<void> _refreshData() async {
    BlocProvider.of<SliderBloc>(context).add(FetchSliders());
  }
}
