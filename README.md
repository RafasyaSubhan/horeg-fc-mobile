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
<Summary><b>Tugas 8</b></Summary>

## Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
Navigator.push() menambahkan halaman baru di atas stack navigasi, sedangkan Navigator.pushReplacement menghapus halaman sekarang dan menambahkan halaman baru. Navigator.push() saat pengguna dapat kembali ke halaman sebelumnya, seperti dari homescreen pindah halaman dan dapat kembali ke homescreen lagi. Sedangkan, Navigator.pushReplacement() saat pengguna tidak boleh kembali, contohnya saat login pengguna yang berhasil login diharapkan tidak dapat kembali ke halaman login kembali.

## Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
`Scaffold`: Kerangka dasar dari sebuah halaman design. Scaffold berguna sebagai tempat untuk meletakkan `Appbar`, `Drawer`, `Body`, dan lainnya 
`Appbar`: Sebagai header di bagian atas. Appbar berguna untuk judul halaman, tombol, dan ikon untuk membuka `Drawer`
`Drawer`: Menu navigasi utama yang tersembunyi. Gunanya untuk menampung link ke halaman-halaman utama aplikasi.

## Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
`Padding`: Readability karena memberikan ruang antar widget
Contoh di newslist_form.dart ada Padding(padding: const EdgeInsets.all(8.0),...)
`SingleChildScrollView`: Memberikan ruang dan mengizinkan pengguna untuk scroll area yang tertutup misalnya oleh keyboard
Contoh di newslist_form.dart ada ...child: SingleChildScrollView(...)
`ListView`: Mirip dengan SingleChildScrollView, ListView membuat pengguna dapat scroll area yang tertutup
Tidak pakai ListView karena udah ada SingleChildScrollView, tetapi contoh lainnya adalah body: ListView.builder(...)

## Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Pertama menentukan color palette. Tentukan prime color, secondary, and background. Setelah itu bisa di-setting di ThemeData main.dart. Seharusnya menghapus pewarnaan manual di file lain, tetapi karena saya ada kendala main.dart tidak bisa pakai warna spesifik (karena pakai primarySwatch)
</details>