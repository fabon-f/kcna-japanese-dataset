# 説明

朝鮮中央通信(kcna.kp)の日本語記事のデータセットと収集用のスクリプトです。[Googleドライブ](https://drive.google.com/drive/folders/0B7AO2iTYHQtoc2cySnhubUZ5NGM?usp=sharing)でダウンロードできます。

The dataset of KCNA's Japanese articles. You can download this on [Google Drive](https://drive.google.com/drive/folders/0B7AO2iTYHQtoc2cySnhubUZ5NGM?usp=sharing).

# ファイルの説明

* `kcna.tar.gz`: メタデータを含む記事のデータ(JSON)
* `kcna-content.tar.gz`: 記事の内容のテキストファイル(1行目が半角スペース区切りでIDと日付、2行目が題名、存在すれば続けて3行目に副題、1行空けて本文)
* `kcna-content-readable.tar.gz`: `kcna-content.tar.gz`を時系列順に100記事ずつ結合してファイル数を減らしたもの

`kcna.tar.gz`や`kcna-content.tar.gz`は解凍すると約28000のファイルが格納されたディレクトリができます。ファイル名は記事のIDを表します。
`kcna-content-readable.tar.gz`は解凍すると281のファイルが格納されたディレクトリができます。

# 動かし方

まず、Bundlerを使い依存しているgemをダウンロードします。

例: `bundle --path vendor/bundle`

例えば、2017/07/15以前の記事を落としてくる場合は以下のようにします。

`bundle exec ruby script/download_all.rb dest_dir 2017-07-15`

途中でダウンロードが止まってしまった場合、最後にダウンロードした記事の日付から再開してください。既にダウンロードした記事に達し、かつ40記事以上ダウンロードした時点でダウンロードは終了します。

# 注意

朝鮮中央通信のサーバにつながらないことが結構あります。諦めましょう。

また、公開しているデータセットはほとんど生の状態で、前処理は一切していません。

# 最後に

実行は自己責任でお願いします。実際に動かすよりGoogleドライブにアップロードしているものをそのまま使った方がよいと思います。
