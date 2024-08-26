# EasyForge

EasyForge は簡単に [Forge](https://github.com/lllyasviel/stable-diffusion-webui-forge) と [Flux](https://blackforestlabs.ai/) を試せる環境です。  
[EasySdxlWebUi](https://github.com/Zuntan03/EasySdxlWebUi) などの画像生成環境のモデルや LoRA を簡単に参照できます。

EasySdxlWebUi とは異なり、Forge と A1111 の環境同期はしていません。  
これにより Forge をシンプルにそのまま利用できます。

## Flux お試しインストール

Flux を試してみたい方向けのインストール方法です。  
**SDXL の画像生成なら [EasySdxlWebUi](https://github.com/Zuntan03/EasySdxlWebUi) などの既存の画像生成環境が今のところオススメです。**

最近の NVIDIA 製ビデオカードを搭載した Windows PCで動作します。  
[Geforce GTX 1660Ti 6GB, RAM 32GB の Win PC で 2:45秒 でした](https://x.com/Zuntan03/status/1823141918160945222)。

「トラブルシューティング」「日本語化」「既存の画像生成環境のモデルや LoRA の参照」などは『[EasyForge のインストールと更新](https://github.com/Zuntan03/EasyForge/wiki/EasyForge-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%A8%E6%9B%B4%E6%96%B0)』。  

1. [EasyForgeInstaller.bat](https://github.com/Zuntan03/EasyForge/raw/main/setup/install/EasyForgeInstaller.bat?ver=1) を右クリックから保存して、インストール先のフォルダで実行します。
	- **`WindowsによってPCが保護されました` と表示されたら、`詳細表示` から `実行` します。**
1. インストールが終わったら、`download/Flux-Minimum.bat` で Flux のモデルをダウンロードします。
1. `Forge.bat` で Forge を起動します。  
1. **（重要）画面左上の `UI` で `flux` を選択します。**
1. 画面上部の `Checkpoint` で `FluxS-Base\flux1-schnell-bnb-nf4-v2.safetensors` を選択します。
1. 画面上部の `VAE / Text Encoder` に `ae.safetensors` `clip_l.safetensors` `t5xxl-Q5_K_M.gguf` のみっつが設定されていることを確認します。
1. プロンプト入力欄下の `Generation`-`Sampling steps` を `4` にします。
	- Forge 起動時の `Sampling steps` を `4` するには、`Settings` の一番下にある `Other`-`Defaults` にて `View changes` で変更内容を確認して `Apply` します。
1. お好みのプロンプトを入力して `Generate` で Flux 画像を生成できます。
1. `InfiniteImageBrowsing.bat` を実行して、`Use Walk mode to browse images`-`txt2img` で生成画像を確認できます。

### Flux お試し Tips

- **Civitai からのダウンロードや Civitai Helper の利用には、Civitai の API キー登録が必要になります。**
	- **`Settings`-`Civitai Helper` の `API key for authenticating with Civitai.` に Civitai の API キーを貼り付けて `Apply settings` します。**
	- API キーの取得方法は [こちら](https://github.com/zixaphir/Stable-Diffusion-Webui-Civitai-Helper/wiki/Civitai-API-Key)、API キーを取得できるアカウントページは[こちら](https://civitai.com/user/account)（下から 2番目の `API Keys`）。  
	![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/setup/CivitaiApiKeyHalf.png)
- `Update.bat` で **EasyForge を更新** できます。  
	- アップデート中にエラーが起きたら、もう一度 `Update.bat` を実行してみてください。
- **UI の日本語化**は `Settings`-`User Interface`-`Localization` を `ja_JP` にして、`Apply settings` から `Reload UI` です。
- **Forge 起動時の UI 状態** の変更は、UI 状態を変更してから`Settings` の一番下にある `Other`-`Defaults` にて `View changes` で変更内容を確認して、`Apply` で保存できます。

## 最近の主な更新

### 2024/08/26

- デフォルトの `t5xxl` を `Q8_0` から `Q5_K_M` に変更しました。

### 2024/08/25

- Flux のモデルや LoRA を簡単に足したり引いたり GGUF にしたりするツール群を `flux_tool` に追加しました。
	- 各 bat を実行して案内に沿ってモデルや LoRA をドラッグ＆ドロップします。
	- `ConvertGguf.bat`: モデル（fp16, 22GB~ 推奨）を GGUF Q8_0 に変換します。
		- Q8_0 以外も変換したい場合は、1度実行してから `flux_tool\env\ConvertGgufFormat.txt` を `Q8_0 Q4_0` のように編集します。
	- `ExtractLora.bat`: 引かれる側と引く側のふたつのモデルの差分から LoRA を抽出します。
		- `ExtractLora-Flux(D|S)-fp(16|8).bat` は各ベースモデルで引きます。
	- `ModelMergeLora.bat`: モデルに Lora をマージします。メインメモリが 64GB 必要です。
		- `flux_merge_lora.py` に `--save_precision bf16 --concat` を指定しています。  
		`flux_tool\env\MergeLoraOption.txt` を編集してオプションを変更できます。  
		`ModelMergeLora.bat` の引数でオプションを追加できます。
	- LoRA の抽出とマージは [sd-scripts](https://github.com/kohya-ss/sd-scripts/tree/sd3) の `flux_extract_lora.py` と `flux_merge_lora.py` を使用しています。
	- GGUF 変換は [ComfyUI-GGUF/tools](https://github.com/city96/ComfyUI-GGUF/tree/main/tools) を使用しています。
- `download/Flux-Minimum.bat` で VAE にオススメの `t5xxl-Q5_K_M` を追加します。
	- VAE に `ae.safetensors`, `clip_l.safetensors`, `t5xxl-Q5_K_M.gguf` を指定してご利用ください。
- download/ 以下のフォルダ構成を変更しました。
	- 今後は `models/Stable-diffusion/` の `FluxD-*` や `FluxS-*` といったフォルダにモデルを保存します。
		- 不要になった `models/Stable-diffusion/Flux/` 内のモデルは削除しても問題ありません。
- `Forge.bat` の呼び出し時に環境変数 `COMMANDLINE_ARGS` が定義されていれば、Forge の起動時引数として扱うようにしました。
- Forge の不具合修正で、`X/Y/Z plot` でモデルの切り替えができます。
	- `Hires. fix` でのモデルの切り替えもできます。

## ドキュメント

### はじめに

- [EasyForge のインストールと更新](https://github.com/Zuntan03/EasyForge/wiki/EasyForge-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%A8%E6%9B%B4%E6%96%B0)

### その他

- [過去の更新履歴](https://github.com/Zuntan03/EasyForge/wiki/%E9%81%8E%E5%8E%BB%E3%81%AE%E6%9B%B4%E6%96%B0%E5%B1%A5%E6%AD%B4)

## ライセンス

このリポジトリの内容は [MIT License](./LICENSE.txt) です。
