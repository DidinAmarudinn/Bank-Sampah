import 'package:bank_sampah/feature/bsu/provider/bsu_provider.dart';
import 'package:bank_sampah/feature/bsu/ui/bottom_sheet_select_gudang.dart';
import 'package:bank_sampah/feature/bsu/ui/penimbangan_bsu_screen.dart';
import 'package:bank_sampah/feature/bsu/ui/penjualan_bsu_screen.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/widget/tb_button_primary_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BSUScreen extends StatefulWidget {
  static const routeName = "/bsu-page";
  const BSUScreen({super.key});

  @override
  State<BSUScreen> createState() => _BSUScreenState();
}

class _BSUScreenState extends State<BSUScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<BSUProvider>(context, listen: false).getPenagihan();
      Provider.of<BSUProvider>(context, listen: false).getPenimbangan();
    });
  }

  int vindex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Penjualan",
            style: kBlackText.copyWith(fontWeight: bold),
          ),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.navigate_before,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              context.pop();
            },
          ),
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: kDarkGreen,
            onTap: (index) {
              setState(() {
                vindex = index;
              });
            },
            tabs: [
              Tab(
                icon: Text(
                  "List Penimbangan",
                  style: vindex == 0 ? kGreenText : kLightGrayText,
                ),
              ),
              Tab(
                icon: Text(
                  "List Penjualan",
                  style: vindex == 1 ? kGreenText : kLightGrayText,
                ),
              )
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: kDefaultPadding),
            child: Column(
              children: [
                const Expanded(
                  child: TabBarView(children: [
                    PenimbanganBSUScreen(),
                    PenjualanBSUScreen(),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: TBButtonPrimaryWidget(
                      buttonName: "Tambah Penimbangan",
                      onPressed: () {
                         showModalBottomSheet(
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return Wrap(
                            children: const [
                              BottomSheetSelectGudang(),
                            ],
                          );
                        });
                      
                      },
                      height: 40,
                      width: double.infinity),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
