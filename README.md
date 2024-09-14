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
1. 画面上部の `Checkpoint` で `flux1-dev-hyper8-Q4_K_S.safetensors` を選択します。
	- `flux1-dev-hyper8-Q8_0.safetensors` の方が精度が高いですが、マシンスペックをより必要とします。
1. 画面上部の `VAE / Text Encoder` に `ae.safetensors` `clip_l.safetensors` `t5xxl-Q6_K.gguf` のみっつが設定されていることを確認します。
	- `t5xxl-Q6_K.gguf` を `t5xxl_fp16.safetensors` にしても動作速度が極端に遅くならないなら、fp16 のほうがオススメです。
2. プロンプト入力欄下の `Generation`-`Sampling steps` を `8` にします。
	- Forge 起動時の `Sampling steps` を `8` するには、`Settings` の一番下にある `Other`-`Defaults` にて `View changes` で変更内容を確認して `Apply` します。
3. お好みのプロンプトを入力して `Generate` で Flux 画像を生成できます。
4. `InfiniteImageBrowsing.bat` を実行して、`Use Walk mode to browse images`-`txt2img` で生成画像を確認できます。

**Forge の Flux でよくトラブる FAQ 設定です。**  
**設定内容がわからないうちは、画像の設定が安全です。**  
![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/log2408/FAQ.png)

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

- EasyForge に ComfyUI をワンクリックで追加して、日本語 LLM による指示（英訳でなく）で Flux Dev の画像を生成する『[日本語 LLM で Flux](https://github.com/Zuntan03/EasyForge/wiki/%E6%97%A5%E6%9C%AC%E8%AA%9E-LLM-%E3%81%A7-Flux)』に対応しました。
  - モデルや LoRA などのファイルは Forge 用にダウンロードしたものをそのまま利用できます。

![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/ComfyLlm/ComfyLlm.webp)

### 2026/09/03

- 『[Flux Dev 簡単クッキング](https://github.com/Zuntan03/EasyForge/wiki/Flux-Dev-%E7%B0%A1%E5%8D%98%E3%82%AF%E3%83%83%E3%82%AD%E3%83%B3%E3%82%B0)』の例として『[Civitai 週間一位の iNiverse Mix を高速化](https://x.com/Zuntan03/status/1830750085887729748)』
  - サンプルモデル『[iNiverseFluxV11-8step](https://huggingface.co/Zuntan/iNiverseFluxV11-8step)』

### 2026/09/01

- LoRA 互換を保ちながら Flux Dev 高速版をお好みモデルにマージする『[Flux Dev 簡単クッキング](https://github.com/Zuntan03/EasyForge/wiki/Flux-Dev-%E7%B0%A1%E5%8D%98%E3%82%AF%E3%83%83%E3%82%AD%E3%83%B3%E3%82%B0)』を公開しました。
  - **成人向けの作例画像は [こちら](https://yyy.wpx.jp/EasyForge/cooking) です。** 
  - Flux Dev を 8ステップ化して、アニメと NSFW を足してみた『FluxDev8AnimeNsfw』モデルは [こちら](https://huggingface.co/Zuntan/FluxDev8AnimeNsfw) です。
    - `download/Flux-Recommended.bat` で `Q8_0` をダウンロードします。

|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/reb_0.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/reb_1.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/reb_2.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/reb_3.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/reb_4.webp)|
|:-:|:-:|:-:|:-:|:-:|
|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/deg_0.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/deg_1.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/deg_2.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/deg_3.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/deg_4.webp)|
|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/meg_0.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/meg_1.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/meg_2.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/meg_3.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/meg_4.webp)|
|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/reb_a.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/reb_b.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/reb_c.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/reb_d.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/reb_e.webp)|
|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/deg_a.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/deg_b.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/deg_c.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/deg_d.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/meg_a.webp)|
||||||
|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/nns_0.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/nns_1.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/nns_2.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/nns_3.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/cooking/nns_4.webp)|

### 2026/08/28

- Flux Dev と Hyper Flux 8step をマージした `flux1-dev-hyper8` を追加しました。
	- **Schnell やそのマージモデルと異なり、8step ですが Dev 用 LoRA がかなり効きます！**
	- `download/Flux-Minimum.bat` で `flux1-dev-hyper8-nf4.safetensors` をダウンロードします。
	- `download/Flux-Recommended.bat` で `flux1-dev-hyper8-Q8_0.safetensors` もダウンロードします。
	- `download/Stable-diffusion/FluxD-Base/` で `fp16` や `Q6_K` もダウンロードできます。
	- [モデルファイル置き場](https://huggingface.co/Zuntan/dist)

LoRA なし作例
|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/log2408/hyper_merge_0.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/log2408/hyper_merge_1.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/log2408/hyper_merge_2.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/log2408/hyper_merge_3.webp)|
|:-:|:-:|:-:|:-:|
|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/log2408/hyper_merge_4.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/log2408/hyper_merge_5.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/log2408/hyper_merge_6.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/log2408/hyper_merge_7.webp)|

LoRA あり作例
![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/log2408/hyper_merge_lora-4k.webp)

- `flux_tool/MergeLora.bat` で sd-scripts 方式 (`*-sds.safetensors`) と ai-toolkit 方式 (`*-ait.safetensors`) の両方を出力するようにしました。
	- マージした LoRA が効いている方のモデルを採用してください。
- `flux_tool/ConvertGguf.bat` がデフォルトで `Q8_0` と `Q6_K` を生成するようにしました。
	- 更新時には `flux_tool/env/ConvertGgufFormat.txt` を削除すると、`Q8_0` と `Q6_K` を生成するようになります。
- デフォルトの `t5xxl` を `Q5_K_M` から `Q6_K` に変更しました。
	- **メインメモリに不足がなければ `t5xxl_fp16` がオススメです。**
- モデルのドロップダウンでフォルダ名を非表示にしました。

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
		- `flux_merge_lora.py` に `--save_precision bf16` を指定しています。  
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

### Flux Dev

- [Flux Dev 簡単クッキング](https://github.com/Zuntan03/EasyForge/wiki/Flux-Dev-%E7%B0%A1%E5%8D%98%E3%82%AF%E3%83%83%E3%82%AD%E3%83%B3%E3%82%B0)

### ComfyUI

- [日本語 LLM で Flux](https://github.com/Zuntan03/EasyForge/wiki/%E6%97%A5%E6%9C%AC%E8%AA%9E-LLM-%E3%81%A7-Flux)
  
### その他

- [過去の更新履歴](https://github.com/Zuntan03/EasyForge/wiki/%E9%81%8E%E5%8E%BB%E3%81%AE%E6%9B%B4%E6%96%B0%E5%B1%A5%E6%AD%B4)

## ライセンス

このリポジトリの内容は [MIT License](./LICENSE.txt) です。
