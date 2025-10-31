🛍️ Test Bentang Altur Teknologia

Test Bentang Altur Teknologia produk berbasis Flutter menggunakan Riverpod sebagai manajemen state dan menerapkan konsep Clean Architecture.
Aplikasi ini mengambil data dari API publik FakeStoreAPI
untuk menampilkan daftar produk, detail produk, serta fitur pencarian dan keranjang belanja.

🎯 Tujuan Proyek

Proyek ini merupakan hasil pengerjaan Flutter Coding Test – PT Bentang Altur Teknologia dengan tujuan menilai kemampuan dalam:

Pengembangan aplikasi Flutter secara menyeluruh

Penerapan arsitektur bersih (Clean Architecture)

Penggunaan manajemen state modern (Riverpod)

Kerapian struktur proyek dan dokumentasi

🧩 Fitur Utama
🔹 Fitur Wajib

Daftar Produk : Menampilkan gambar, nama, dan harga produk dari API.

Detail Produk: Menampilkan informasi lengkap produk (gambar, deskripsi, dan harga).

Pencarian Produk: Mencari produk berdasarkan nama secara real-time.

Loading & Error State: Indikator visual untuk proses pemuatan data dan kesalahan jaringan.

Manajemen State dengan Riverpod: Mengelola data produk dan keranjang belanja secara reaktif.

🎁 Fitur Bonus

Infinite Scroll: Produk dimuat otomatis saat pengguna mencapai bagian bawah daftar.

Add to Cart: Tambah dan hapus produk dari keranjang.

Local Storage : Menyimpan data keranjang secara lokal agar tetap ada setelah aplikasi ditutup.

Clean Architecture: Pemisahan kode menjadi beberapa layer untuk menjaga skalabilitas dan keteraturan proyek.

🧱 Struktur Arsitektur

Proyek ini mengikuti pola Clean Architecture dengan pembagian empat layer utama:

Layer	Deskripsi
Domain	Berisi model atau entitas inti (misalnya Product).
Infrastructure	Berisi implementasi repository dan pengambilan data dari API.
Application	Mengatur logika bisnis dan state management (notifier & provider).
Presentation	Menangani UI, widget, dan interaksi pengguna.

Struktur folder:
```
lib/
├── application/       # State management (notifier, provider)
├── domain/            # Model & entitas inti
├── infrastructure/    # Repository & service API
├── presentation/      # UI & halaman tampilan
└── main.dart          # Entry point aplikasi
```
🧰 Package yang Digunakan
Teknologi yang Digunakan

Flutter	3.35.5	
Dart	3.9.2	
flutter_riverpod	^3.0.3	
http	^1.5.0
shared_preferences	^2.5.3	
cupertino_icons	^1.0.8

flutter_hooks (opsional)	Integrasi state yang lebih reaktif
⚙️ Cara Menjalankan Proyek
1️⃣ Clone Repository

Unduh atau clone repository:
```
https://github.com/azharrizal06/test-Bentang-Altur-Teknologia.git
```
cd product_catalog_app

2️⃣ Install Dependency

Jalankan perintah berikut:
```
flutter pub get
```
3️⃣ Jalankan Aplikasi

Pastikan emulator atau perangkat fisik sudah terhubung, kemudian:
```
flutter run
```
🎨 Desain & UI

Desain menggunakan Material 3 dengan tampilan modern dan responsif.

GridView digunakan untuk tampilan daftar produk.

SafeArea dan padding diterapkan agar UI tampil proporsional di berbagai perangkat.

Tombol Add to Cart dan Buy Now diletakkan di bagian bawah halaman detail produk.

⚠️ Penanganan Error

Menampilkan pesan kesalahan apabila data gagal dimuat dari API.

Memberikan indikator loading saat data sedang diambil.

Menangani kondisi ketika hasil pencarian kosong.

🧾 Informasi Build
Komponen	Versi
Flutter SDK	3.35.5 • channel stable
Dart SDK	3.9.2
DevTools	2.48.0
OpenJDK Runtime Environment	21.0.6 




