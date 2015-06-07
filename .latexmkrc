# $pdflatex = 'pdflatex -shell-escape';
$hash_calc_ignore_pattern{'ctr'} = '^\d+$'; # counttexruns
$hash_calc_ignore_pattern{'pdf'} = '.';     # auto-pst-pdf
$pdf_mode = 1;
$pdf_previewer = "start evince %O %S";
