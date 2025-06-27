# HabitGrow 📱

Günlük alışkanlık takip uygulaması - iOS platformu için SwiftUI ile geliştirilmiş modern ve kullanıcı dostu bir uygulama.

## 🚀 Özellikler

- **Günlük Alışkanlık Takibi**: Günlük alışkanlıklarınızı kolayca takip edin
- **Özelleştirilebilir Alışkanlıklar**: Her alışkanlık için isim, emoji, renk ve gün seçimi
- **Görsel Geri Bildirim**: Tamamlanan alışkanlıklar için animasyonlu geri bildirim
- **İlerleme Takibi**: Günlük ilerleme çubuğu ile motivasyon
- **Modern UI/UX**: Apple Human Interface Guidelines'a uygun tasarım

## 📱 Ekran Görüntüleri

### Ana Ekran
- Bugünün tarihi ve ilerleme durumu
- Alışkanlık kartları (emoji, isim, seçili günler)
- Tamamlandı butonları
- Boş durum ekranı

### Alışkanlık Kartı
- Emoji ve renkli çember
- Alışkanlık adı
- Seçili günler (kısaltılmış)
- Tamamlandı durumu

## 🛠 Teknik Detaylar

### Kullanılan Teknolojiler
- **SwiftUI**: Modern UI framework
- **Swift 5.0+**: Güncel Swift sürümü
- **iOS 17.0+**: Minimum desteklenen iOS sürümü

### Proje Yapısı
```
HabitGrow/
├── HabitGrowApp.swift      # Ana uygulama dosyası
├── ContentView.swift       # Ana içerik görünümü
├── MainView.swift          # Günlük alışkanlık listesi
├── HabitCardView.swift     # Alışkanlık kartı bileşeni
└── HabitModel.swift        # Veri modelleri ve örnek veriler
```

### Veri Modeli
- `Habit`: Alışkanlık veri modeli
- `WeekDay`: Haftanın günleri enum'u
- `Color` extension: Hex renk desteği

## 🎯 Gelecek Özellikler

- [ ] Yeni alışkanlık ekleme ekranı
- [ ] CoreData entegrasyonu
- [ ] iCloud senkronizasyonu
- [ ] İstatistik ekranı
- [ ] Bildirimler
- [ ] Tema desteği

## 🚀 Kurulum

1. Xcode 15.0+ ile projeyi açın
2. iOS 17.0+ simülatör veya cihaz seçin
3. Build ve Run yapın

## 📝 Geliştirme Notları

### Kod Yapısı
- **Component-based**: Yeniden kullanılabilir bileşenler
- **MVVM Pattern**: Model-View-ViewModel mimarisi
- **Turkish Localization**: Türkçe dil desteği
- **Accessibility**: Erişilebilirlik desteği

### Tasarım Prensipleri
- Apple Human Interface Guidelines uyumlu
- Modern iOS tasarım dili
- Kullanıcı dostu animasyonlar
- Responsive tasarım

## 🤝 Katkıda Bulunma

1. Fork yapın
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Commit yapın (`git commit -m 'Add amazing feature'`)
4. Push yapın (`git push origin feature/amazing-feature`)
5. Pull Request oluşturun

## 📄 Lisans

Bu proje MIT lisansı altında lisanslanmıştır.

## 👨‍💻 Geliştirici

HabitGrow - Günlük alışkanlık takip uygulaması

---

**Not**: Bu proje geliştirme aşamasındadır. Örnek verilerle çalışmaktadır. 