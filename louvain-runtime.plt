set term pdf
set terminal pdf size 10in,2.5in
set output 'louvain-runtime.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set style fill solid border lt -1
set style textbox opaque noborder
set xtics rotate by 30 right
set key above font ",12"
set ylabel  '{/:Bold Runtime (s)}'
set y2label '{/:Bold Modularity}'
set logscale y
unset logscale y2
set y2tics 0.1
set grid y


## Draw plot
plot "louvain-compare.csv" \
     using ($3/1000):xtic(1) title 'Vite (Louvain)'     with histogram fill pattern 2, \
  '' using ($5/1000):xtic(1) title 'Grappolo (Louvain)' with histogram fill pattern 2, \
  '' using ($7/1000):xtic(1) title 'NetworKit Louvain'  with histogram fill pattern 2, \
  '' using ($8/1000):xtic(1) title 'Our Louvain'        with histogram fill pattern 7 ls 8, \
  '' using 2 title '' ls 1 lw 3 with linespoints axes x1y2, \
  '' using 4 title '' ls 2 lw 3 with linespoints axes x1y2, \
  '' using 6 title '' ls 3 lw 3 with linespoints axes x1y2, \
  '' using 9 title '' ls 4 lw 3 lc 0 with linespoints axes x1y2
  # '' using ($0-3./10):(2*$3/1000):(sprintf("%.0f", $3/$8)) with labels rotate by 90 offset character 0,0 title '', \
  # '' using ($0-1./10):(2*$5/1000):(sprintf("%.0f", $5/$8)) with labels rotate by 90 offset character 0,0 title '', \
  # '' using ($0+1./10):(2*$7/1000):(sprintf("%.0f", $7/$8)) with labels rotate by 90 offset character 0,0 title ''




## Columns in CSV file.
# 1. graph
# 2. vite-m
# 3. vite-t
# 4. grappolo-m
# 5. grappolo-t
# 6. networkit-m
# 7. networkit-t
# 8. sahu-t
# 9. sahu-m
