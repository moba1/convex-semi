# Convex Optimization輪読資料置き場
[Convex Optimization](https://web.stanford.edu/~boyd/cvxbook/bv_cvxbook.pdf)輪読の資料を置く場所

## ディレクトリ構成
`src`ディレクトリの下に`n`(第`n`回の意味)というディレクトリを掘ってそこにTeXファイルと生成したPDFを置く
```
src/
 ├─ 1/
 │  ├─ hoge.pdf 
 │  └─ hoge.tex
 │
 ├─ 2/
 │  ├─ fuga.pdf
 │  └─ fuga.tex
 ┆
```

## 運用上の注意
`master`には`/doc`ディレクトリを含まないように。

資料は全て自動でTravis CIでビルドされる。
ビルドした成果物は`gh-pages`ブランチにプッシュされ、[ここ](https://moba1.github.com/convex-semi)に設置するようにしている。

## PRの出し方
1. このリポジトリをクローン(すでにクローンしてあればpull)
1. 資料を書く
1. `git checkout -b '適当なブランチ名'`
1. `git add` & `git commit`
1. `git rebase -i 'git log'で見れる、自分の最初のコミットの1つ前のハッシュ`して、粒度がある程度大きくなるくらいにコミットを整理
1. `git push origin HEAD`

## コミットのまとめ方
例えば、次のように、`038d6ea`というコミットハッシュを持つコミットが`origin/master`ブランチのHEADで、そこから新しくブランチを切って作業したとする(例での画面は、自分がブランチを切って編集したあとに`git log --oneline --graph`した様子)。
```
* 7f467ac 最後のコミット <-- 自分の切ったブランチのHEAD
* a9b4212 3番目のコミット
* 9c76102 2番目のコミット
* 3b67e89 自分の最初のコミット <-- 自分が切ったブランチにおける最初のコミット
* 038d6ea origin/masterのHEAD
```
ここで、次のコマンドを発行する。
```bash
$ git rebase -i 自分が切った最初のコミットの1つ前のコミットが持つコミットハッシュ
```
例の場合だと、自分の切ったブランチにおける最初のコミットの1つ前のコミットは、`origin/master`のHEADなので、
```bash
$ git rebase -i 038d6ea
```
となる。
すると、エディタ-が開いて、次のような内容が表示される。
```
pick 3b67e89 最初のコミットのコミットメッセージ
pick 9c76102 2番目のコミットのコミットメッセージ
pick a9b4212 3番目のコミットのコミットメッセージ
pick 7f467ac 最後のコミットのコミットメッセージ

# 色々書いてあるコメント行が続く。
# ここは編集しないでいい。
# ...
```
ここで、下3つのコミットハッシュの左に書いてある`pick`を`s`に変更する。
```
pick 3b67e89 最初のコミットのコミットメッセージ
s 9c76102 2番目のコミットのコミットメッセージ
s a9b4212 3番目のコミットのコミットメッセージ
s 7f467ac 最後のコミットのコミットメッセージ
```
そして、エディタにこの状態を保存して、エディタを閉じる。
すると、再度エディタが立ち上がり、次のような内容が表示される。
```
# This is a combination of 3 commits
# This is the 1st commit message:

最初のコミットのコミットメッセージ
# This is the commit message #2:

2番目のコミットのメッセージ
# This is the commit message #3:

3番目のコミットのメッセージ
# This is the commit message #4:

最後のコミットのコミットメッセージ

# 以降は全てコメントして色々書いてある
# ...
```
これらを次のように1つのコミットメッセージに潰す。
```
まとめたコミットメッセージ

# 上にあったコメントが続いている部分
# 'Please enter the commit' なんちゃらて書いてある
# ...
```
この状態を保存してエディタを閉じると、何もコンフリクトがなければsquashされる。

## `template`の中身
1. `Makefile`
   * `TEX_COMPILER`: TeXコンパイラを指定する(デフォルト`uplatex`)
   * `DVI_COMPILER`: DVIファイルのコンパイラを指定する(デフォルト`dvipdfmx`)
   * `MAIN_TEX_FILE`: コンパイルする起点となるTeXファイルのパス(デフォルト`main.tex`)
   * `MAX_REPEAT`: `latexmkrc`を利用しない場合に使用される。この回数分だけコンパイルする(デフォルトは3回)
1. `main.tex`: コンパイルする際の起点となるTeXファイル

## 資料の用意方法
```bash
$ cd クローン先
$ bin/create.bash 回数 # 回数には自分の担当した輪読第n回の`n`を指定。たとえば`1`とか
```
これで、`template`ディレクトリから`src/n`へ必要なファイルが移動される。
もし、`latexmkr`を利用するのであれば、`create.bash`に`-l`オプションを渡せばいい:
```bash
$ bin/create.bash -l 回数
```

## 全資料のビルド方法
全ての資料をビルドする場合は
```bash
$ cd クローン先
$ make
```
でOK。
これで`プロジェクトルート/doc`へビルド済みのPDFが用意される。

逆に言えば、ここに書いた`Makefile`を利用したシステムに沿わないと、全資料をビルドできなくなる。
全資料をビルドできるようにするには、次の条件を満たす必要がある:

* 資料をビルドするディレクトリ(例えば`src/1`など)には常に`Makefile`を置いておく
* `doc`へPDFを移動するようにする
* 各資料があるディレクトリ(`src`直下の`src/1`など)におく`Makefile`は`make clean`できるようにする

## 全資料のクリーンアップ
次のコマンドで生成物、中間ファイルを削除できる。
```bash
$ cd クローン先
$ make clean
```
