# 卒論のテンプレートについて

## 書く際に変更が必要なもの
- graduation_thesis.sty  
卒論用のメインファイルになります。各章やサブファイルをこちらで読み込んでください。

- style/toppage.sty  
論文タイトルと年度について変更してください．

## 環境構築
Pythonがインストールされていることを前提とします。

### Windowsの場合
[公式ドキュメント](https://docs.docker.jp/docker-for-windows/install.html)を参考にDockerをインストールしてください。
[Make](https://redhologerbera.hatenablog.com/entry/2021/05/16/163305)をインストールし、パスを通してください。

### Mac の場合
[公式ドキュメント](https://docs.docker.jp/docker-for-mac/install.html)を参考にDockerをインストールしてください。

## 使い方
Docker Desktopは起動した状態で使用してください。
`utils/format.py`で設定されているREPLACE_TEXTSのリストで設定されている値を書き換えることで、フォーマット対象の文字列を修正することができます。必要に応じて変更してください。

### Windowsの場合
ターミナルで卒論を保存しているディレクトリまで移動してください。
以下のコマンドでパスを取得します。

> $ pwd

> C:\Users\Kensuke.N\Desktop\GraduationThesisTemplate

こちらのパスもとに、Makefile内でcompile-wのブロックでの`${pwd}`を書き換えます。
上記の例では、`C:\Users\Kensuke.N\Desktop\GraduationThesisTemplate`に書き換えることになります。
ここまでで準備が終了したので、以下のコマンドでtexファイルをコンパイルしてください。
> make compile-w

### Macの場合
以下のコマンドでコンパイルをすることが出来ます．

> make
