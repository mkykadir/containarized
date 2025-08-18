# Konteyner Geliştirici Ortamları

Bu alanda Dockerfile dosyalarıyla kullanıma hazır, bazı geliştirici araçları için
konteyner halinde geliştirmeye hazır ortamlar sunulmuştur. Temel amaç bu ortamları
tek komutla kullanıma hazır hale getirmek, tamamen temiz bir ortamda başlamak,
izole ve sürdürülebilir geliştirici oramları sağlamaktır.

Geliştirici araçları da güvenik açıkları içerebilir ve genelde bu araçları
yüklerken sistem izinleri ve tüm dosyalara erişim izinlerini veriyoruz. Farklı
projeler için farklı araçların farklı kütüphane gereksinimleri birbirleriyle
karışabiliyor. Bu sistem sayesinde her projeniz için sıfırdan kurulmuş o projeye
özel bir geliştirici ortamı sağlayabilirsiniz. Üstelik araçlarla işiniz bittiğinde
konteyner ve imajı silerek bilgisayarınızı tamamen temizleyebilirsiniz.

## Kullanım

Sisteminizde Docker kurulu ve çalışır halde olmalıdır. Konteryner ortamı normal
ortama göre biraz daha yavaş çalışabilir fakat çoğu projede güçlü donanımla bu 
hissedilmez. Docker ayarlarında kaynakları konfigüre ediniz.

1. Temel imajı oluşturun

```sh
docker build . --file base.Dockerfile --tag basedevimage:bookworm
```

2. Geliştirici ortamını oluşturun (örn. Bun)

```sh
docker build . --file bun.Dockerfile --tag bundevimage:bookworm
```

3. Konteynerı başlatın

```sh
docker run -it bundevimage:bookworm
```

Bu konteyner içinde kodunuzu klonlayıp çalışabilir, mevcut kodunuzu volume olarak bağlayabilir veya IDE Ortamında projenize özel kullanabilirsiniz.

#### Visual Studio (veya Cursor) ile Kullanmak

a. IDE'i açın ve [dev containers eklentisini](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) yükleyin

b. Projenizin klasörünü IDE'de açın

c. Projenizin içinde `.devcontainer/devcontainer.json` dosyasını oluşturun, örnek için `examples` klasörüne bakın

d. Projenizi konteyner içinde yeniden açın

e. Daha fazla bilgi için VS Code [dokümantasyonunu](https://code.visualstudio.com/docs/devcontainers/create-dev-container) kontrol edebilirsiniz

Bu kurulum yöntemiyle yerel çalışma ortamınızı temiz tutabilirsiniz, Redis, PostgreSQL gibi araçları bile yüklemeden onların hazır Docker imajlarıyla tek tuşla başlayan tam bir geliştirici ortamı kurabilirsiniz. `examples/compose-dev.yaml` dosyasından daha fazla bilgi alın.