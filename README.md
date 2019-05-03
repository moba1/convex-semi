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
