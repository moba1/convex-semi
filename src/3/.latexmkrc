#!/usr/bin/env perl

$latex = 'pdflatex -synctex=1 -no-guess-input-enc -halt-on-error';
$latex_silent = "$latex -interaction=batchmode";
$biber = 'biber --bblencoding=utf8 -u -U --output_safechars';
$biblatex = 'upbibtex';
$dvipdf = 'dvipdfmx %O -o %D %S';
$pdf_mode = 3;

