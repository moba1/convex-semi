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

## PRの出し方
1. このリポジトリをクローン
2. 資料を書く
3. `git checkout -b '適当なブランチ名'`
4. `git add`する
5. `git push origin HEAD`

## 資料の用意方法
```bash
$ cd クローン先
$ ./create.bash 回数 # 回数には自分の担当した輪読第n回の`n`を指定。たとえば`1`とか
```
これで、`template`ディレクトリから`src/n`へ必要なファイルが移動される。

## 全資料のビルド方法
全ての資料をビルドする場合は
```bash
$ cd クローン先
$ make
```
でOK。
これで`プロジェクトルート/doc`へビルド済みのPDFが用意される。
