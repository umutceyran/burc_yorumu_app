import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

// ignore: must_be_immutable
class BurcDetayScreen extends StatefulWidget {
  String buyukResimYolu;
  String burcDetayi;
  String burcAdi;
  int indexNo;
  BurcDetayScreen({
    required this.indexNo,
    required this.buyukResimYolu,
    required this.burcDetayi,
    required this.burcAdi,
    super.key,
  });

  @override
  State<BurcDetayScreen> createState() => _BurcDetayScreenState();
}

class _BurcDetayScreenState extends State<BurcDetayScreen> {
  Color _appBarRengi = Colors.white;
  late PaletteGenerator _generator;
  @override
  void initState() {
    super.initState();    
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _appBarRengimiBul());   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverAppBar(
            backgroundColor: _appBarRengi,
            pinned: true,
            expandedHeight: 390,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: Text(
                '${widget.burcAdi} Burcu Özellikleri',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              background: Image.asset(
                  fit: BoxFit.cover, 'assets/images/${widget.buyukResimYolu}'),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  widget.burcDetayi,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
_appBarRengimiBul()async{
   _generator = await PaletteGenerator.fromImageProvider(
        AssetImage('assets/images/${widget.buyukResimYolu}'));
    setState(() {
      _appBarRengi = _generator.dominantColor!.color;
    });
}
}
