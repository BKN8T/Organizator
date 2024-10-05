
# 📂 Dosya Düzenleyici Betiği / File Organizer Script

## ✨ Özellikler / Features
Bu betik, bir klasördeki dosyaları türlerine, tarihine ve boyutuna göre düzenleyerek ilgili alt klasörlere taşır. Kullanıcı dostu bir menüye sahiptir ve çeşitli ayarlamalar yapmanıza olanak tanır.

This script organizes files in a directory based on their type, creation date, and size, moving them into corresponding subfolders. It includes a user-friendly menu and allows various customizations.

### 📝 Özellikler / Features:
- **📋 Kullanıcı Dostu Menü / User-Friendly Menu**: Kullanıcılara işlem yapmadan önce seçim yapma ve onay alma imkanı sunar.
- **⏱️ Geri Sayımlı Onay Sistemi / Countdown Confirmation**: İşlemlere başlamadan önce geri sayım ve iptal seçeneği.
- **📁 Dinamik Taşıma Klasörleri / Dynamic Target Folders**: Dosyaların taşınacağı hedef klasörlerin isimlerini belirleme imkanı.
- **🗂️ Loglama / Logging**: Yapılan işlemleri log dosyasına kaydeder.

## ⚙️ Kurulum / Installation

1. Bu betiği klonlayın veya indirin:
   Clone or download this script:

   ```bash
   git clone https://github.com/BKN8T/Organizator
   cd Organizator/bin
   ```

2. Betiğe çalıştırma izni verin:
   Give execute permission to the script:

   ```bash
   chmod +x main.sh
   ```

## 🚀 Kullanım / Usage

Betik, bir klasördeki dosyaları düzenlemek için kullanılır. Betiği çalıştırmak için:

The script is used to organize files in a directory. To run the script:

```bash
bash main.sh
```

### 🔧 Parametreler / Parameters:

- **`/path/to/klasor`**: Düzenlemek istediğiniz klasörün yolunu belirtin.
  Specify the path of the directory you want to organize.

### 📌 Örnek / Example:

```bash
bash main.sh /home/kullanici/Belgeler
```

### 👥 Kullanıcı Etkileşimi / User Interaction

- Betik çalıştırıldıktan sonra hedef klasör isimlerini belirlemek için kullanıcıya sorular sorulur.
- İşlemler başlamadan önce 5 saniyelik bir geri sayım ile kullanıcıdan onay alınır.

After running the script, the user will be asked questions to determine target folder names.
There is a 5-second countdown to confirm before starting the operations.

## 📋 Gereksinimler / Requirements

- 🖥️ Bash 4.0 veya üstü / Bash 4.0 or later
- 🐧 Linux veya Unix tabanlı bir işletim sistemi / A Linux or Unix-based operating system

## 📝 Loglama / Logging

Betiğin çalıştırılması sırasında yapılan işlemler, belirlenen bir log dosyasına kaydedilir. Log dosyası betik çalıştırıldığında `dosya_duzenleyici_YYYYMMDD_HHMMSS.log` formatında klasörde oluşturulur.

During the execution of the script, operations are logged into a specified log file. The log file is created in the format `dosya_duzenleyici_YYYYMMDD_HHMMSS.log` when the script runs.

## 🤝 Katkıda Bulunma / Contributing

Katkıda bulunmak istiyorsanız, lütfen bir pull request gönderin veya bir sorun bildirin.

If you want to contribute, please send a pull request or report an issue.

## 📜 Lisans / License

📄 Daha fazla bilgi için `LICENSE` dosyasına bakabilirsiniz.

📄 For more information, see the `LICENSE` file.
---
