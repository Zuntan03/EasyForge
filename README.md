# EasyForge

EasyForge は簡単・安全に [新生 Forge](https://github.com/lllyasviel/stable-diffusion-webui-forge) と [Flux](https://blackforestlabs.ai/) を試せる環境です。  
[EasySdxlWebUi](https://github.com/Zuntan03/EasySdxlWebUi) や A1111 などの既存の画像生成環境のモデルや LoRA を、簡単に共有できます。

EasySdxlWebUi とは異なり、A1111 環境との同期はしていません。  
これにより Forge をそのままシンプルに利用できます。

## Flux お試しインストール

Flux を試してみたい方向けのインストール方法です。  
「日本語化」「問題解決」「既存のモデルや LoRA の共有」などは『[EasyForge のインストール](https://github.com/Zuntan03/EasyForge/wiki/EasyForge-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB) 』。

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
	- `Polling refresh` で自動更新もできます。

### はじめの Tips

- `Update.bat` で **EasyForge を更新** できます。  
- **UI の日本語化**は `Settings`-`User Interface`-`Localization` を `ja_JP` にして、`Apply settings` から `Reload UI` です。
- **Forge 起動時の UI 状態** の変更は、UI 状態を変更してから`Settings` の一番下にある `Other`-`Defaults` にて `View changes` で変更内容を確認して、`Apply` で保存できます。
	- `Settings` 左上の絞り込み欄に `.j` と入力すると、簡単にアクセスできます。

## 最近の更新

### 2024/08/14

- `download/Flux-Minimum.bat` で `flux1-schnell-bnb-nf4` のみをダウンロードするようにしました。
	- `flux1-dev-bnb-nf4` も必要な場合は、`download/Flux-Recommended.bat` を実行してください。
- `flux1-dev-bnb-nf4` を `flux1-dev-bnb-nf4-v2` に更新しました。
	- `download/Stable-diffusion/Flux/flux1-dev-bnb-nf4-v2.bat` または `download/Flux-Recommended.bat` でダウンロードできます。

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
- [EasyForge のインストール](https://github.com/Zuntan03/EasyForge/wiki/EasyForge-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)

## ライセンス

このリポジトリの内容は [MIT License](./LICENSE.txt) です。
