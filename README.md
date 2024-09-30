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

**ComfyUI を更新したい場合も、Forge の更新と同様に `Update.bat` で更新してください。**  
`ComfyUI-Update.bat` は `Update.bat` 後に正常動作します。

### 2024/09/30

- `61-Flux書き換えアップスケール` ワークフローを追加し、ドキュメントに『[全自動 Flux 書き換えアップスケール](https://github.com/Zuntan03/EasyForge/wiki/%E5%85%A8%E8%87%AA%E5%8B%95-Flux-%E6%9B%B8%E3%81%8D%E6%8F%9B%E3%81%88%E3%82%A2%E3%83%83%E3%83%97%E3%82%B9%E3%82%B1%E3%83%BC%E3%83%AB)』を追記しました。
	- 新しい [Upscaler ControlNet](https://huggingface.co/jasperai/Flux.1-dev-Controlnet-Upscaler) とタイル別プロンプト生成による Flux Dev 書き換えアップスケールです。
	- Pony などの生成画像や、写真もアップスケールできます。

|[imgsli で比較（ズームしてください）](https://imgsli.com/MzAxMTU2)|[imgsli で比較（ズームしてください）](https://imgsli.com/MzAxMTU3)|
|:-:|:-:|
|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/ComfyUpscale/Shibuya1Mix.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/ComfyUpscale/Shibuya2Mix.webp)|

[**imgsli で比較（ズームしてください）**](https://imgsli.com/MzAxMTUy)  
![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/ComfyUpscale/ShibuyaPhotoMix.webp)

### 2024/09/28

- [うみゆきさんのノイズ i2i でくっきり背景](https://x.com/umiyuki_ai/status/1839593798353228233) を t2i で試してみました。
  - Denoise とステップ数などのバランスがピーキーですがハマると高密度です。
  - i2i の方がノイズを柔軟に調整できそうです。

|主な設定|1bit ノイズテクスチャ|
|:-:|:-:|
|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/log2409/AntiDoF.png)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/log2409/noise-896_1152.png)|

ワークフロー付き作例（`01-日本語LLMでFlux` を少しだけ改造したモノ）

|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/log2409/shibuya_0.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/log2409/shibuya_1.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/log2409/shibuya_2.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/log2409/shibuya_3.webp)|
|:-:|:-:|:-:|:-:|
|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/log2409/shibuya_4.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/log2409/shibuya_5.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/log2409/shibuya_6.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/log2409/shibuya_7.webp)|

### 2024/09/27

- ワークフローに `42-範囲指定書き換えで手直しやディティールアップ` を追加し、ドキュメントに『[マスク指定でいろいろ書き換え](https://github.com/Zuntan03/EasyForge/wiki/%E3%83%9E%E3%82%B9%E3%82%AF%E6%8C%87%E5%AE%9A%E3%81%A7%E3%81%84%E3%82%8D%E3%81%84%E3%82%8D%E6%9B%B8%E3%81%8D%E6%8F%9B%E3%81%88)』を追記しました。
  - 様々な手法でマスクを用意することで、Flux で画像を柔軟に書き換えます。

![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/ComfyBg/Bg.webp)

### 2024/09/25

- `ComfyUI-Workflow/Flux/` の `01-日本語LLMでFlux.json` と `41-自動検出書き換えで手直しやディティールアップ.json` で `基本プロンプト` が適用されない不具合を修正しました。

### 2024/09/24

- 画像の背景を削除するワークフロー `ComfyUI-Workflow/Flux/22-背景の削除.json` を追加しました。
  - 新しい BiRefNet、InSPyReNet、AnimeSegmentation、Rembg といったアルゴリズムやパラメータの異なる 21枚の背景削除画像を生成しますので、一番いいものを選んでください。  
![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/log2409/RemoveBg.webp)
- `ComfyUI-Workflow` の `*.json` ファイルを `Flux/` サブフォルダに移動しました。

### 2024/09/22

- ComfyUI に多機能 ADetailer な『[お手軽な手直し＆ディティールアップ](https://github.com/Zuntan03/EasyForge/wiki/%E3%81%8A%E6%89%8B%E8%BB%BD%E3%81%AA%E6%89%8B%E7%9B%B4%E3%81%97%EF%BC%86%E3%83%87%E3%82%A3%E3%83%86%E3%82%A3%E3%83%BC%E3%83%AB%E3%82%A2%E3%83%83%E3%83%97)』を追加しました。
  - たくさんの機能を簡単に利用できる、Flux の良さを生かした自動化ディティーラです。
  - 元画像が SDXL や Pony や SD1.5 でも、強力な Flux で手直しできます。

|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/ComfySegsI2i/Pick.webp)<br>![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/ComfySegsI2i/HandFix.webp)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/ComfySegsI2i/GenPrompt.webp)|
|:-:|:-:|

![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyForge/ComfySegsI2i/SegmMsg.webp)


## ドキュメント

### はじめに

- [EasyForge のインストールと更新](https://github.com/Zuntan03/EasyForge/wiki/EasyForge-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%A8%E6%9B%B4%E6%96%B0)

### Flux Dev

- [Flux Dev 簡単クッキング](https://github.com/Zuntan03/EasyForge/wiki/Flux-Dev-%E7%B0%A1%E5%8D%98%E3%82%AF%E3%83%83%E3%82%AD%E3%83%B3%E3%82%B0)

### ComfyUI

- [日本語 LLM で Flux](https://github.com/Zuntan03/EasyForge/wiki/%E6%97%A5%E6%9C%AC%E8%AA%9E-LLM-%E3%81%A7-Flux)
- [いらないモノを手軽に消す](https://github.com/Zuntan03/EasyForge/wiki/%E3%81%84%E3%82%89%E3%81%AA%E3%81%84%E3%83%A2%E3%83%8E%E3%82%92%E6%89%8B%E8%BB%BD%E3%81%AB%E6%B6%88%E3%81%99)
- [お手軽な手直し＆ディティールアップ](https://github.com/Zuntan03/EasyForge/wiki/%E3%81%8A%E6%89%8B%E8%BB%BD%E3%81%AA%E6%89%8B%E7%9B%B4%E3%81%97%EF%BC%86%E3%83%87%E3%82%A3%E3%83%86%E3%82%A3%E3%83%BC%E3%83%AB%E3%82%A2%E3%83%83%E3%83%97)
- [マスク指定でいろいろ書き換え](https://github.com/Zuntan03/EasyForge/wiki/%E3%83%9E%E3%82%B9%E3%82%AF%E6%8C%87%E5%AE%9A%E3%81%A7%E3%81%84%E3%82%8D%E3%81%84%E3%82%8D%E6%9B%B8%E3%81%8D%E6%8F%9B%E3%81%88)

### その他

- [過去の更新履歴](https://github.com/Zuntan03/EasyForge/wiki/%E9%81%8E%E5%8E%BB%E3%81%AE%E6%9B%B4%E6%96%B0%E5%B1%A5%E6%AD%B4)

## ライセンス

このリポジトリの内容は [MIT License](./LICENSE.txt) です。
