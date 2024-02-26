import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';

class AddBookController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController kategoriId = TextEditingController();
  final TextEditingController judul = TextEditingController();
  final TextEditingController penulis = TextEditingController();
  final TextEditingController penerbit = TextEditingController();
  final TextEditingController gambar = TextEditingController();
  final TextEditingController tahunTerbit = TextEditingController();

  final loading = false.obs;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> addBook() async {
    loading.value = true;
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(
          Endpoint.addbook,
          data: {
            "kategori_id": kategoriId.text,
            "judul": judul.text,
            "penulis": penulis.text,
            "penerbit": penerbit.text,
            "gambar": gambar.text,
            "tahun_terbit": tahunTerbit.text,
          },
        );
        if (response.statusCode == 201) {
          Get.back();
          Get.snackbar("Berhasil", "Menambahkan Buku", backgroundColor: Colors.green);
        } else {
          Get.snackbar("Sorry", "Menambahkan Buku Gagal", backgroundColor: Colors.orange);
        }
      }
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}", backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    } finally {
      loading.value = false;
    }
  }

  void increment() => count.value++;
}
