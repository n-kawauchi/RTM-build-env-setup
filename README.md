# RTM-build-env-setup

## OpenRTM-aistビルド環境構築用Vagrantfile

* Vagrantfileでのディスクサイズ指定のため、vagrant-disksize プラグインのインストールが必要です

`vagrant plugin install vagrant-disksize`

* GUI環境用にGuest Additions を最新化するプラグインをインストールする

`vagrant plugin install vagrant-vbguest`

* vagrant up にて、OpenRTM-aistの core developer向けパッケージまでインストールされます
