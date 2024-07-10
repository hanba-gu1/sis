# SiS
学校PC用の自動セットアップスクリプトです。
## 導入方法
まず、Gitをインストールしてください。

[ここ](https://gitforwindows.org/)からインストールできます。

インストールできたら、コマンドプロンプトを開いて`git config --global http.proxy http://{username}:{password}@10.1.100.111:8080`を実行してください。<br>
{username}と{password}は学校PCにログインするときのユーザー名とパスワードです。パスワードに記号が含まれる場合は[このサイト](https://tech-unlimited.com/urlencode.html)等でURLエンコードしてから入力してください。

更に、`git clone https://github.com/hanba-gu1/sis U:\sis`を実行してください。

するとhomesに`sis`フォルダができているので、その中に`settings.json`ファイルを作り、`settings.json.example`の内容をコピーしてください。

`settings.json`の内容は適宜変更してください。<br>
`taskbar`は`flag`をtrueにするとタスクバーが左寄せになり、`desktop`はflagをtrueにすると`image_path`のフルパスにある画像ファイルをデスクトップ背景に設定します。<br>
`proxy`の`flag`はtrueにしておいてください。


## 使用方法
`sis`フォルダ内の`sis.bat`を実行します。

初回実行時にusernameとpasswordを聞かれるので、学校PCにログインするときのユーザー名とパスワードを入力してください。

## 連絡
不具合や不明点等はDiscord等で受け付けます。
