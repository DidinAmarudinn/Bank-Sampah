import 'package:bank_sampah/feature/login/model/bsu_model.dart';
import 'package:bank_sampah/feature/nasabah/model/nasabah_model.dart';
import 'package:bank_sampah/feature/profile/provider/profile_provider.dart';
import 'package:bank_sampah/themes/constants.dart';
import 'package:bank_sampah/utils/request_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DetailProfileScreen extends StatefulWidget {
  static const routeName = "/detail-profile-page";
  const DetailProfileScreen({super.key});

  @override
  State<DetailProfileScreen> createState() => _DetailProfileScreenState();
}

class _DetailProfileScreenState extends State<DetailProfileScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ProfileProvider>(context, listen: false).getLevel();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);
    return Scaffold(
        body: provider.state == RequestState.loading
            ? const Center(
                child: SpinKitFadingCircle(
                  size: 40,
                  color: kDarkGreen,
                ),
              )
            : provider.isBsu
                ? SafeArea(child: _buildBsu(provider.bsuModel, provider.email))
                : SafeArea(child: _buildNasabah(provider.nasabahModel)));
  }

  Widget _buildNasabah(NasabahModel? data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: kDefaultPadding,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: InkWell(
            onTap: () {
              context.pop();
            },
            child: Container(
                padding: const EdgeInsets.all(kDefaultPadding / 2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        spreadRadius: 4,
                        blurRadius: 30,
                        offset: const Offset(0, 4),
                      )
                    ]),
                child: const Icon(
                  Icons.navigate_before,
                  color: kDarkGreen,
                )),
          ),
        ),
        const SizedBox(
          height: kDefaultPadding,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            "Data Pribadi Nasabah",
            style: kBlackText.copyWith(fontSize: 16, fontWeight: semiBold),
            textAlign: TextAlign.left,
          ),
        ),
        _buildRowData("Nama: ", data?.namaNasabah ?? ""),
        _buildRowData("Email: ", data?.email ?? ""),
        _buildRowData("No Telepon: ", data?.noKontak ?? ""),
        _buildRowData("Kode Nasabah: ", data?.kodeNasabah ?? ""),
      ],
    );
  }

  Widget _buildBsu(BSUModel? data, String email) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: kDefaultPadding,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: InkWell(
            onTap: () {
              context.pop();
            },
            child: Container(
                padding: const EdgeInsets.all(kDefaultPadding / 2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        spreadRadius: 4,
                        blurRadius: 30,
                        offset: const Offset(0, 4),
                      )
                    ]),
                child: const Icon(
                  Icons.navigate_before,
                  color: kDarkGreen,
                )),
          ),
        ),
        const SizedBox(
          height: kDefaultPadding,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            "Data Pribadi BSU",
            style: kBlackText.copyWith(fontSize: 16, fontWeight: semiBold),
            textAlign: TextAlign.left,
          ),
        ),
        _buildRowData("Nama Unit: ", data?.namaUnit ?? ""),
        _buildRowData("Email: ", email),
        _buildRowData("No Telepon: ", data?.noKontak ?? ""),
        _buildRowData("Periode angkut: ", data?.periodeAngkut ?? ""),
        _buildRowData("Kode Unit: ", data?.kodeUnit ?? ""),
        _buildRowData("Ketua Unit: ", data?.ketuaUnit ?? ""),
        _buildRowData("Hari Angkut: ", data?.hariAngkut ?? ""),
      ],
    );
  }

  Widget _buildRowData(String label, String val) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            label,
            style: kDarkGrayText,
          ),
          Text(
            val,
            style: kBlackText.copyWith(fontWeight: semiBold),
          )
        ],
      ),
    );
  }
}
