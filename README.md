# EasyForge

EasyForge は簡単・安全に [新生 Forge](https://github.com/lllyasviel/stable-diffusion-webui-forge) と [Flux](https://blackforestlabs.ai/) を試せる環境です。  
[EasySdxlWebUi](https://github.com/Zuntan03/EasySdxlWebUi) や A1111 などの既存の画像生成環境のモデルや LoRA を、簡単に参照できます。

EasySdxlWebUi とは異なり、A1111 環境との同期はしていません。  
これにより Forge をそのままシンプルに利用できます。

## よくあるご質問

- [Civitai](https://civitai.com/) からのファイルダウンロードに失敗する。
	- **[Civitai からのダウンロードには、Civitai の API キーの登録が必要になります。](https://github.com/Zuntan03/EasyForge/wiki/EasyForge-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%A8%E6%9B%B4%E6%96%B0#%E3%83%A2%E3%83%87%E3%83%AB%E3%82%84-lora-%E3%81%AE%E3%83%80%E3%82%A6%E3%83%B3%E3%83%AD%E3%83%BC%E3%83%89)**
- **モデルを変えると `AssertionError: You do not have CLIP state dict!` が出る。**
	- **`VAE` に `t5xxl` のどちらかと `ae` と `clip_l` の 3種を設定します。**
- [X/Y/Z plot でモデルが切り替わらない](https://github.com/lllyasviel/stable-diffusion-webui-forge/issues?q=is%3Aissue+is%3Aopen+X%2FY%2FZ+Plot)。
	- Hires-fix のモデル変更も同様らしい？
- [`Generate Forever` を `Cancel Forever` できない](https://github.com/lllyasviel/stable-diffusion-webui-forge/issues?q=is%3Aissue+is%3Aopen+Generate+forever)。

## Flux お試しインストール

Flux を試してみたい方向けのインストール方法です。  
**SDXL の画像生成なら [EasySdxlWebUi](https://github.com/Zuntan03/EasySdxlWebUi) などの既存の画像生成環境が今のところオススメです。**

最近の NVIDIA 製ビデオカードを搭載した Windows PCで動作します。  
[Geforce GTX 1660Ti 6GB, RAM 32GB の Win PC で 2:45秒 でした](https://x.com/Zuntan03/status/1823141918160945222)。

「トラブルシューティング」「日本語化」「既存の画像生成環境のモデルや LoRA の参照」などは『[EasyForge のインストール](https://github.com/Zuntan03/EasyForge/wiki/EasyForge-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB) 』。  

1. [EasyForgeInstaller.bat](https://github.com/Zuntan03/EasyForge/raw/main/setup/install/EasyForgeInstaller.bat?ver=1) を右クリックから保存して、インストール先のフォルダで実行します。
	- **`WindowsによってPCが保護されました` と表示されたら、`詳細表示` から `実行` します。**
1. インストールが終わったら、`download/Flux-Minimum.bat` で Flux のモデルをダウンロードします。
1. `Forge.bat` で Forge を起動します。  
1. **（重要）画面左上の `UI` で `flux` を選択します。**
1. 画面上部の `Checkpoint` で `Flux\flux1-schnell-bnb-nf4.safetensors` を選択します。
1. プロンプト入力欄下の `Generation`-`Sampling steps` を `4` にします。
	- Forge の起動時に自動で `Sampling steps` を `4` するには、`Settings` の一番下にある `Other`-`Defaults` にて `View changes` で変更内容を確認して `Apply` します。
1. お好みのプロンプトを入力して `Generate` で Flux 画像を生成できます。
1. `InfiniteImageBrowsing.bat` を実行して、`Use Walk mode to browse images`-`txt2img` で生成画像を確認できます。

### Tips

- **Civitai からのダウンロードや Civitai Helper の利用には、Civitai の API キー登録が必要になります。**
	- **`Settings`-`Civitai Helper` の `API key for authenticating with Civitai.` に Civitai の API キーを貼り付けて `Apply settings` します。**
	- API キーの取得方法は [こちら](https://github.com/zixaphir/Stable-Diffusion-Webui-Civitai-Helper/wiki/Civitai-API-Key)、API キーを取得できるアカウントページは[こちら](https://civitai.com/user/account)（下から 2番目の `API Keys`）。  
	![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/setup/CivitaiApiKeyHalf.png)
- `Update.bat` で **EasyForge を更新** できます。  
	- アップデート中にエラーが起きたら、もう一度 `Update.bat` を実行してみてください。
- **UI の日本語化**は `Settings`-`User Interface`-`Localization` を `ja_JP` にして、`Apply settings` から `Reload UI` です。
- **Forge 起動時の UI 状態** の変更は、UI 状態を変更してから`Settings` の一番下にある `Other`-`Defaults` にて `View changes` で変更内容を確認して、`Apply` で保存できます。
	- `Settings` 左上の絞り込み欄に `'v` と入力すると、簡単にアクセスできます。

## 最近の主な更新

### 2024/08/19

- Flux の Dev と Schnell をマージして表現力を高めつつ 8step で生成できる『[Flux Fusion DS](https://civitai.com/models/630820)』のダウンロードに対応しました。
	- FP16 並みに高品質の GGUF Q8_0 (3060: 29sec)と、高速な NF4(3060: 23sec) を `download\Flux-Recommended.bat` でダウンロードします。
	- **`VAE` に `t5xxl` のどちらかと `ae` と `clip_l` の 3種を設定して利用します。**

### 2024/08/18

- `download/wildcards.bat` で Civitai からワイルドカードを複数ダウンロードします。
	- **[Civitai からのダウンロードには、Civitai の API キーの登録が必要になります。](https://github.com/Zuntan03/EasyForge/wiki/EasyForge-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%A8%E6%9B%B4%E6%96%B0#%E3%83%A2%E3%83%87%E3%83%AB%E3%82%84-lora-%E3%81%AE%E3%83%80%E3%82%A6%E3%83%B3%E3%83%AD%E3%83%BC%E3%83%89)**

### 2024/08/17

- `download/adetailer.bat` で Civitai から ADetailer の検出モデルを 10種ダウンロードします。
	- **[Civitai からのダウンロードには、Civitai の API キーの登録が必要になります。](https://github.com/Zuntan03/EasyForge/wiki/EasyForge-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%A8%E6%9B%B4%E6%96%B0#%E3%83%A2%E3%83%87%E3%83%AB%E3%82%84-lora-%E3%81%AE%E3%83%80%E3%82%A6%E3%83%B3%E3%83%AD%E3%83%BC%E3%83%89)**
- `download/Stable-diffusion/Flux/` に `fluximation_v1Fp8.bat` と `fluxMonochromemanga_v10.bat` を追加しました。
- `ToshiakiMosaic.bat` を追加しました。
- 小ネタ: `stable-diffusion-webui-forge/notification.mp3` を置くと、画像生成時に再生されるようになりました。

### 2024/08/16

- `flux1-schnell-bnb-nf4` の `VAE` を `t5xxl_fp16` 指定で上書きできるようなので、`download/Flux-Minimum.bat` に加えました。
- Civitai Helper に新生 Forge 対応が組み込まれたので、パッチの適用を無効化しました。

### 2024/08/15

- GGUF フォーマットの Flux Dev を試すための `download/Flux-Gguf.bat` を追加しました。
	- VAE に `ae`, `clip_l`, `t5xxl_fp8_e4m3fn` の 3種を指定して、Checkpoint に `Flux\flux1-dev-Q(4|5|8)_0.gguf` を指定してください。
	- `t5xxl_fp8_e4m3fn` を `t5xxl_fp16` にすることもできます。
- ドキュメントの『[EasyForge のインストールと更新](https://github.com/Zuntan03/EasyForge/wiki/EasyForge-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%A8%E6%9B%B4%E6%96%B0)』を書き直しました。
- Flux を NSFW に対応させた`FluxUnchained` を `download/Flux-Recommended.bat` でダウンロードできるようにしました。
	- **Civitai からのダウンロードや Civitai Helper の利用には、Civitai の API キーの登録が必要になります。**
		- **`Settings`-`Civitai Helper` の `API key for authenticating with Civitai.` に Civitai の API キーを貼り付けて `Apply settings` します。**
		- API キーの取得方法は [こちら](https://github.com/zixaphir/Stable-Diffusion-Webui-Civitai-Helper/wiki/Civitai-API-Key)、API キーを取得できるアカウントページは[こちら](https://civitai.com/user/account)（下から 2番目の `API Keys`）。  
	- `Civitai Helper` の `Scan Models for Civitai` で、モデルにアイコン画像を設定できます。

### 2024/08/14

- `download/Flux-Minimum.bat` で `flux1-schnell-bnb-nf4` のみをダウンロードするようにしました。
	- `flux1-dev-bnb-nf4` も必要な場合は、`download/Flux-Recommended.bat` を実行してください。
- `flux1-dev-bnb-nf4` を `flux1-dev-bnb-nf4-v2` に更新しました。
	- `download/Stable-diffusion/Flux/flux1-dev-bnb-nf4-v2.bat` または `download/Flux-Recommended.bat` でダウンロードできます。
- [aria2](https://aria2.github.io/) による高速ダウンロードに対応しました。
	- aria2 でのダウンロードに失敗する場合は、`setup\download\Aria-UseCurl.bat` で curl によるダウンロードに切り替えられます。

### 2024/08/13

- [zixaphir 版 Civitai Helper](https://github.com/zixaphir/Stable-Diffusion-Webui-Civitai-Helper) を [新生 Forge 用のパッチ](https://github.com/zixaphir/Stable-Diffusion-Webui-Civitai-Helper/pull/124) で利用できるようにしました。
	- [Civitai Helper を利用するには API キーの登録が必要です](https://github.com/Zuntan03/EasySdxlWebUi/wiki/%E3%83%A2%E3%83%87%E3%83%AB%E3%82%84-LoRA-%E3%81%AE%E8%BF%BD%E5%8A%A0#civitai-%E3%81%8B%E3%82%89%E3%83%A2%E3%83%87%E3%83%AB%E3%82%84-lora-%E3%82%92%E8%BF%BD%E5%8A%A0) 。
- 新生 Forge への対応が不十分な Civitai Browser Plus を一旦削除しました。

### 2024/08/12

- README に『Flux お試しインストール』を追記しました。
- ドキュメントに『[EasyForge のインストール](https://github.com/Zuntan03/EasyForge/wiki/EasyForge-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)』を追加しました。
- `download/Stable-diffusion/Flux/flux1-schnell-bnb-nf4.bat` を追加しました。
	- **`download/Flux-Minimum.bat` の再実行で `flux1-schnell-bnb-nf4` もダウンロードします。**
- torch のバージョンを `torch==2.3.1+cu121 torchvision==0.18.1+cu121` に引き上げました。

### 2024/08/11

- EasyForge を公開しました。

## ドキュメント

### はじめに

- [EasyForge のインストールと更新](https://github.com/Zuntan03/EasyForge/wiki/EasyForge-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%A8%E6%9B%B4%E6%96%B0)

## ライセンス

このリポジトリの内容は [MIT License](./LICENSE.txt) です。
