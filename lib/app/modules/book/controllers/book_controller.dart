import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_book.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';

class BookController extends GetxController with StateMixin<List<DataBook>> {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getData() async {
    // Menampilkan loading indicator sebelum mendapatkan data
    change(null, status: RxStatus.loading());

    try {
      final response = await ApiProvider.instance().get(Endpoint.book);

      if (response.statusCode == 200) {
        final responseData = response.data;
        final responseBook = ResponseBook.fromJson(responseData);

        if (responseBook.data != null) {
          if (responseBook.data!.isEmpty) {
            // Menampilkan pesan jika data kosong
            change(null, status: RxStatus.empty());
          } else {
            // Mengubah status menjadi success dan menyimpan data
            change(responseBook.data, status: RxStatus.success());
          }
        } else {
          // Menampilkan pesan error jika data tidak valid
          change(null, status: RxStatus.error("Data tidak valid"));
        }
      } else {
        // Menampilkan pesan error jika gagal mengambil data dari server
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioError catch (e) {
      // Menangani error dari Dio
      if (e.response != null && e.response!.data != null) {
        change(null, status: RxStatus.error("Dio: ${e.response!.data['message']}"));
      } else {
        change(null, status: RxStatus.error("Dio: ${e.message}"));
      }
    } catch (e) {
      // Menangani error umum
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void increment() => count.value++;
}
