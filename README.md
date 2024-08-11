# EasyForge

**工事中**
**EasyForge は現在β版です。**  

EasyForge は簡単・安全に新生 Forge を試せる環境です。  
A1111 や Forge や EasySdxlWebUi などの既存環境から、モデルやLoRAなどを簡単に参照できます。

EasySdxlWebUi とは異なり A1111 との共存はせず、Forge をなるべくそのままシンプルに利用します。

## インストール

**Flux は Geforce RTX 30XX 以上で `EasyForgeInstaller.bat` と `download/Flux-Minimum.bat` を実行して、`Forge.bat` で生成できます。**  
**[Flux 公式解説](https://github.com/lllyasviel/stable-diffusion-webui-forge/discussions/981) の `Sanity Check` で動作を確認できます。**

1. [EasyForgeInstaller.bat](https://github.com/Zuntan03/EasyForge/raw/main/setup/install/EasyForgeInstaller.bat?ver=1) を右クリックから保存して、インストール先のフォルダで実行します。
	- **`WindowsによってPCが保護されました` と表示されたら、`詳細表示` から `実行` します。**
1. インストールが終わったら、モデルや LoRA などを準備します。  
	新しくダウンロードするか、既存の生成環境のフォルダを参照します。
	- `download/` にある bat ファイルで、モデルや LoRA などをダウンロードします。
		- `download/Flux-Minimum.bat` で Flux 関連ファイルをダウンロードします。
		- `download/SDXL-Minimum.bat` で SDXL 関連ファイルをダウンロードします。
	- `setup/Link-stable-diffusion-webui.bat` に既存の A1111 や Forge のフォルダをドラッグ＆ドロップすると、モデルや LoRA などのデフォルトのフォルダを参照します。
	- `setup/Link-EasySdxlWebUi.bat` に既存の EasySdxlWebUi のフォルダをドラッグ＆ドロップすると、モデルや LoRA などのフォルダを参照します。
	- `setup/link/` にある bat ファイルにフォルダをドラッグ＆ドロップすると、モデルや LoRA といったフォルダ単位で参照できます。
	- 起動時オプションによるフォルダ指定は、拡張機能が対応していない場合がありますのでおすすめしません。
1. **モデルや LoRA などの準備ができたら `Forge.bat` で Forge を起動します。**  
	**`Update.bat` で EasyForge を更新できます。**

- `InfiniteImageBrowsing.bat` で生成した画像を確認できます。  
	`Polling refresh` で生成した画像を自動的に表示できます。
- UI の日本語化は `Settings`-`User Interface`-`Localization` を `ja_JP` にして、`Apply settings` と `Reload UI` です。
- Forge 起動時の UI の値・状態は、`Settings`-`Defaults` の `View changes` で変更を確認して、`Apply` で保存できます。
	- `Settings` 左上の絞り込み欄に `.j` と入力すると、簡単にアクセスできます。

### Civitai Browser Plus

`CivitaiBrowserPlus.bat` で Civitai からモデルや LoRA などをダウンロード・管理できます。

**`Settings`-`Browser` で `Personal CivitAI API key` に [Civitai API キーを設定してから](https://www.google.com/search?q=Civitai+API+%E3%82%AD%E3%83%BC) 利用します。**

アイコンが化けていますが、文字入力欄左のボタンで検索フィルタを指定して、右のボタンで検索です。

Civitai Browser Plus が有効だと Tag Complete が動作しないため、別起動にしています。  
Civitai 系拡張の Gradio 4 対応が進めば、乗り換える可能性があります。  
おすすめの Civitai 系拡張がありましたら、お知らせください。

### インストールのトラブルシューティング

- アバストなどのウィルスチェックソフトが有効だと、インストールに失敗する場合があります。
- Windows PC の管理者権限がないと、インストールに失敗する場合があります。
- VPN を利用していると、インストールに失敗する場合があります。
- プロキシ環境でインストールに失敗する場合は、[Git for Windows](https://gitforwindows.org/) と [Python 3.10.6](https://www.python.org/ftp/python/3.10.6/python-3.10.6-amd64.exe)(または 3.10.x) を [パスを通してインストール](https://github.com/Zuntan03/SdWebUiTutorial/blob/main/_/doc/SdWebUiInstall/SdWebUiInstall.md#git-for-windows-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB) して、EasyForge を再インストールします。

## ライセンス

このリポジトリの内容は [MIT License](./LICENSE.txt) です。
