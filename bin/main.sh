#!/bin/bash

# Kullanıcı dostu giriş mesajı
echo "=== Dosya Düzenleyici Betiği ==="
echo "Bu betik, dosyalarınızı türüne, tarihine ve boyutuna göre düzenler."
echo

# Kullanıcıdan hedef klasör yolunu al
if [ -z "$1" ]; then
    read -rp "Lütfen düzenlemek istediğiniz klasörün yolunu girin: " HEDEF_KLASOR
else
    HEDEF_KLASOR="$1"
fi

# Klasörün var olup olmadığını kontrol et
if [ ! -d "$HEDEF_KLASOR" ]; then
    echo "Geçersiz klasör yolu. Betik sonlandırılıyor."
    exit 1
fi

# Hedef klasörlerin isimlerini kullanıcıdan al
read -rp "Resimler için hedef klasör adı girin (varsayılan: Resimler): " RESIMLER
read -rp "Videolar için hedef klasör adı girin (varsayılan: Videolar): " VIDEOLAR
read -rp "Belgeler için hedef klasör adı girin (varsayılan: Belgeler): " BELGELER
read -rp "Büyük dosyalar için hedef klasör adı girin (varsayılan: Buyuk_Dosyalar): " BUYUK_DOSYALAR
read -rp "Diğer dosyalar için hedef klasör adı girin (varsayılan: Diger): " DIGER

# Varsayılan isimleri kontrol et ve atama yap
RESIMLER="${RESIMLER:-Resimler}"
VIDEOLAR="${VIDEOLAR:-Videolar}"
BELGELER="${BELGELER:-Belgeler}"
BUYUK_DOSYALAR="${BUYUK_DOSYALAR:-Buyuk_Dosyalar}"
DIGER="${DIGER:-Diger}"

# Gerekli klasörleri oluştur
mkdir -p "$HEDEF_KLASOR/$RESIMLER" "$HEDEF_KLASOR/$VIDEOLAR" "$HEDEF_KLASOR/$BELGELER" "$HEDEF_KLASOR/$BUYUK_DOSYALAR" "$HEDEF_KLASOR/$DIGER"

# Geri sayımlı onay sistemi
echo "Dosyaları düzenlemeye başlamadan önce onayınızı almak istiyoruz."
for i in {5..1}; do
    echo "$i saniye içinde işlem başlayacak. Devam etmek için Ctrl+C ile iptal edebilirsiniz."
    sleep 1
done

# Log dosyasını tanımla
LOG_DOSYASI="$HEDEF_KLASOR/dosya_duzenleyici_$(date +"%Y%m%d_%H%M%S").log"
echo "=== Dosya Düzenleyici Log Başlangıcı ===" > "$LOG_DOSYASI"

# Dosyaları sırayla işleme al
for DOSYA in "$HEDEF_KLASOR"/*; do
    if [ -f "$DOSYA" ]; then
        DOSYA_TARIHI=$(date -r "$DOSYA" +"%Y-%m-%d")
        DOSYA_BOYUT=$(stat -c%s "$DOSYA")

        # Tarihe göre alt klasör oluştur
        TARİH_KLASORU="$HEDEF_KLASOR/Tarih_$DOSYA_TARIHI"
        mkdir -p "$TARİH_KLASORU"

        # Dosya türüne göre taşıma
        case "${DOSYA##*.}" in
            jpg|jpeg|png|gif)
                mv "$DOSYA" "$HEDEF_KLASOR/$RESIMLER/Tarih_$DOSYA_TARIHI/"
                echo "Resim dosyası taşındı: $DOSYA -> $HEDEF_KLASOR/$RESIMLER/Tarih_$DOSYA_TARIHI/" >> "$LOG_DOSYASI"
                ;;
            mp4|mkv|avi)
                mv "$DOSYA" "$HEDEF_KLASOR/$VIDEOLAR/Tarih_$DOSYA_TARIHI/"
                echo "Video dosyası taşındı: $DOSYA -> $HEDEF_KLASOR/$VIDEOLAR/Tarih_$DOSYA_TARIHI/" >> "$LOG_DOSYASI"
                ;;
            pdf|docx|txt)
                mv "$DOSYA" "$HEDEF_KLASOR/$BELGELER/Tarih_$DOSYA_TARIHI/"
                echo "Belge dosyası taşındı: $DOSYA -> $HEDEF_KLASOR/$BELGELER/Tarih_$DOSYA_TARIHI/" >> "$LOG_DOSYASI"
                ;;
            *)
                mv "$DOSYA" "$HEDEF_KLASOR/$DIGER/Tarih_$DOSYA_TARIHI/"
                echo "Diğer dosya taşındı: $DOSYA -> $HEDEF_KLASOR/$DIGER/Tarih_$DOSYA_TARIHI/" >> "$LOG_DOSYASI"
                ;;
        esac

        # Dosya boyutuna göre büyük dosyaları taşı
        if [ "$DOSYA_BOYUT" -gt 10485760 ]; then # 10 MB'den büyük dosyalar
            mv "$DOSYA" "$HEDEF_KLASOR/$BUYUK_DOSYALAR/"
            echo "Büyük dosya taşındı (10 MB'den büyük): $DOSYA -> $HEDEF_KLASOR/$BUYUK_DOSYALAR/" >> "$LOG_DOSYASI"
        fi
    fi
done

# Log dosyasını sonlandır
echo "=== Dosya Düzenleyici Log Bitişi ===" >> "$LOG_DOSYASI"
echo "Dosyalar başarıyla düzenlendi. Log dosyası: $LOG_DOSYASI"