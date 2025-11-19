# Horeg FC
<details>
<Summary><b>Tugas 7</b></Summary>

## Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget!
Secara sederhana, Widget Tree adalah kerangka dari seluruh User Interface (UI). Seperti namanya, widget tree adalah struktur data hierarkis (pohon) yang memberi tahu Flutter bagaimana cara menyusun, menata letak, dan merender setiap elemen visual di layar.
Definisi parent-child di sini adalah bagaimana widget 'dibungkus' dalam widget yang lain. Widget parent adalah widget yang 'membungkus' widget lain. Sedangkan widget child adalah widget yang 'dibungkus' di dalam parent.

## Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya!
* MaterialApp: Widget root yang menyediakan struktur dasar aplikasi 
* StatelessWidget: Tipe widget dasar untuk UI yang tidak berubah secara internal 
* Scaffold: Menyediakan struktur layout dasar material design 
* AppBar: Menampilkan bar navigasi atas Text: Menampilkan teks 
* Padding: Memberi ruang kosong (bantalan) di sekitar widget 
* Column: Menyusun widget secara vertikal 
* Row: Menyusun widget secara horizontal 
* SizedBox: Membuat kotak kosong dengan ukuran tetap (biasa untuk spasi) 
* Center: Memposisikan widget anaknya di tengah 
* GridView: Menampilkan widget dalam grid 
* Card: Menampilkan panel dengan tampilan material design 
* Container: Wadah yang dapat dikustomisasi 
* Material: Potongan Material Design (dipakai untuk memberi warna/bentuk) 
* InkWell: Membuat area yang dapat diklik 
* Icon: Menampilkan ikon

## Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root!
MaterialApp adalah widget inti yang membungkus seluruh aplikasi Anda untuk memberikan fungsionalitas dan standar Material Design (sistem desain Google).
Fungsinya adalah sebagai "pengatur" level atas yang menyediakan berbagai layanan penting ke semua widget di bawahnya (keturunannya). Layanan ini meliputi Tema, Navigasi, Halaman Awal, Layanan Bawaan
MaterialApp sering digunakan sebagai widget roo karena ia perlu membungkus semua widget lain agar bisa menyediakan layanan-layanan di atas.

## Jelaskan perbedaan antara StatelessWidget dan StatefulWidget! Kapan kamu memilih salah satunya?
StatelessWidget adalah widget yang statis, tidak bisa diberubah meskipun diberi perilaku apapun (immutable). StatefulWidget adalah widget yang dinamis, bisa berubah jika mendapat perilaku yang didefinisikan.
Pilih StatelessWidget jika hanya perlu menampilkan informasi saja, tidak perlu mengelola data apapun. Sedangkan, pilih StatefulWidget saat UI Widgetnya bergantung dengan data yang bisa berubah karena interaksi pengguna, seperti checkbox.

## Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext penting karena ia adalah satu-satunya cara bagi sebuah widget untuk berinteraksi dengan ancestor-nya (parent, grandparent, dll). Ia digunakan untuk "mencari" widget atau layanan lain yang ada di atasnya dalam tree. Di dalam mode build, parameter yang digunakan untuk mengambil data dari widget ancestor-nya adalah context.

## Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart"!
Hot reload: Mengubah UI dengan sangat cepat tanpa menghilangkan state
Hot restart: Memuat ulang seluruh aplikasi dari awal dan mereset semua datanya
</details>
<details>
<Summary><b>Tugas 9</b></Summary>

## Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
Navigator.push() menambahkan halaman baru di atas stack navigasi, sedangkan Navigator.pushReplacement menghapus halaman sekarang dan menambahkan halaman baru. Navigator.push() saat pengguna dapat kembali ke halaman sebelumnya, seperti dari homescreen pindah halaman dan dapat kembali ke homescreen lagi. Sedangkan, Navigator.pushReplacement() saat pengguna tidak boleh kembali, contohnya saat login pengguna yang berhasil login diharapkan tidak dapat kembali ke halaman login kembali.

## Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
`Scaffold`: Kerangka dasar dari sebuah halaman design. Scaffold berguna sebagai tempat untuk meletakkan `Appbar`, `Drawer`, `Body`, dan lainnya 
`Appbar`: Sebagai header di bagian atas. Appbar berguna untuk judul halaman, tombol, dan ikon untuk membuka `Drawer`
`Drawer`: Menu navigasi utama yang tersembunyi. Gunanya untuk menampung link ke halaman-halaman utama aplikasi.

## Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
`Padding`: Readability karena memberikan ruang antar widget
Contoh di productlist_form.dart ada Padding(padding: const EdgeInsets.all(8.0),...)
`SingleChildScrollView`: Memberikan ruang dan mengizinkan pengguna untuk scroll area yang tertutup misalnya oleh keyboard
Contoh di productlist_form.dart ada ...child: SingleChildScrollView(...)
`ListView`: Mirip dengan SingleChildScrollView, ListView membuat pengguna dapat scroll area yang tertutup
Tidak pakai ListView karena udah ada SingleChildScrollView, tetapi contoh lainnya adalah body: ListView.builder(...)

## Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Pertama menentukan color palette. Tentukan prime color, secondary, and background. Setelah itu bisa di-setting di ThemeData main.dart. Seharusnya menghapus pewarnaan manual di file lain, tetapi karena saya ada kendala main.dart tidak bisa pakai warna spesifik (karena pakai primarySwatch)
</details>
<details>
<Summary><b>Tugas 8</b></Summary>

##  Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
Kita perlu membuat model untuk menjamin keamanan tipe data (type safety) dan struktur data yang jelas.
* Validasi Tipe: Model mencegah error fatal (runtime crash) akibat salah tipe data (misal: int dianggap String).
* Null-Safety: Model memastikan kita menangani data yang mungkin kosong (null) sejak awal penulisan kode.
* Maintainability: Tanpa model, kita bergantung pada key string manual yang rawan typo dan tidak memiliki fitur autocomplete dari IDE, membuat kode sulit dirawat.

## Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
* Package http: Pustaka dasar untuk melakukan permintaan jaringan standar (GET, POST, dll).
* CookieRequest: Wrapper di atas http (dari package pbp_django_auth) yang otomatis menangani dan menyimpan session cookies.
* Perbedaan: http tidak menyimpan status login (stateless), sedangkan CookieRequest mempertahankan sesi login pengguna di seluruh aplikasi.

## Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest harus dibagikan ke semua komponen (menggunakan Provider) agar state login (sesi pengguna/cookies) tetap konsisten. Jika kita membuat instance baru di setiap halaman, sesi login akan hilang dan pengguna dianggap logout saat pindah halaman.

## Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
* 10.0.2.2: Alamat IP khusus bagi Emulator Android untuk mengakses localhost komputer kita.
* CORS & SameSite: Mengizinkan server Django menerima permintaan dari domain/port berbeda (Flutter Web/Mobile) dan mengizinkan pengiriman kredensial (cookies).
* Izin Internet Android: Memberi hak akses kepada aplikasi Android untuk menggunakan jaringan internet HP/Emulator.
* Konsekuensi: Jika salah satu terlewat, aplikasi akan mengalami error seperti Connection Refused, blokir keamanan browser, atau gagal login karena cookie tidak tersimpan.

## Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
* Pengguna mengisi Form di Flutter; data divalidasi dan diubah menjadi format JSON.
* Data dikirim menggunakan request.postJson ke endpoint Django.
* Django menerima, memvalidasi, dan menyimpan data ke database.
* Untuk menampilkan, Flutter melakukan request.get ke endpoint JSON Django.
* Data JSON yang diterima diubah menjadi objek Model Dart dan ditampilkan ke layar menggunakan widget (seperti ListView atau GridView).

## Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
* `Register`: Flutter mengirim username & password via POST. Django memvalidasi dan membuat akun User baru di database.
* `Login`: Flutter mengirim kredensial. Django memverifikasi dengan authenticate(). Jika cocok, Django membuat session dan mengirimkan cookie session ID kembali ke Flutter. CookieRequest menyimpan cookie ini.
* `Logout`: Flutter mengirim permintaan logout. Django menghapus sesi di server, dan CookieRequest menghapus cookie yang tersimpan di aplikasi, mengembalikan pengguna ke status guest.

## Steps
1.  **Persiapan Backend (Django)**
    * Mengonfigurasi `settings.py` dengan menambahkan `corsheaders` dan `10.0.2.2` pada `ALLOWED_HOSTS` untuk izin akses.
    * Membuat view baru yang mengembalikan respons JSON (bukan HTML) untuk kebutuhan API mobile.
    * Melakukan deployment backend agar bisa diakses oleh aplikasi Flutter.

2.  **Integrasi Autentikasi**
    * Menginstal package `pbp_django_auth` dan `provider`.
    * Membungkus root widget di `main.dart` dengan `Provider` yang menyediakan `CookieRequest` agar sesi login dapat dibagikan ke seluruh aplikasi.

3.  **Implementasi Fitur Login & Register**
    * Membuat halaman `RegisterPage` untuk mengirim data akun baru ke endpoint Django via `request.postJson`.
    * Membuat halaman `LoginPage` untuk melakukan autentikasi via `request.login` dan menyimpan *cookie* sesi jika berhasil.

4.  **Pembuatan Model Kustom**
    * Menggunakan situs *Quicktype* untuk mengubah data JSON dari endpoint Django menjadi kode Dart (`models/product_entry.dart`).
    * Langkah ini dilakukan untuk menjamin keamanan tipe data (*type safety*) dan kemudahan akses data.

5.  **Halaman Daftar Produk (List)**
    * Membuat halaman yang menggunakan `FutureBuilder` untuk mengambil data dari endpoint JSON secara asinkron.
    * Menampilkan data yang didapat menggunakan `ListView.builder` dan widget `Card` kustom.

6.  **Halaman Detail Produk**
    * Menambahkan navigasi `Navigator.push` pada setiap kartu produk.
    * Mengirimkan objek produk yang diklik sebagai parameter ke halaman detail, sehingga seluruh atribut produk dapat ditampilkan tanpa *fetch* ulang.

7.  **Filter Item Pengguna (My Products)**
    * Membuat endpoint baru di Django yang memfilter produk berdasarkan `user=request.user`.
    * Membuat halaman list di Flutter menjadi dinamis agar bisa menerima parameter URL berbeda untuk "All Products" dan "My Products".