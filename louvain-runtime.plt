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
set logscale y
set grid y


## Draw plot
plot "louvain-compare.csv" \
     using ($3/1000):xtic(1) title 'Vite (Louvain)'     with histogram fill pattern 3, \
  '' using ($5/1000):xtic(1) title 'Grappolo (Louvain)' with histogram fill pattern 3, \
  '' using ($7/1000):xtic(1) title 'NetworKit Louvain'  with histogram fill pattern 3, \
  '' using ($8/1000):xtic(1) title 'GVE-Louvain'        with histogram fill pattern 3 ls 8, \
  '' using ($0-5.0/20):(2.1*$3/1000):(sprintf("%.0f", $3/1000)) with labels rotate by 90 offset character 0,0 title '', \
  '' using ($0-1.5/20):(2.1*$5/1000):(sprintf("%.0f", $5/1000)) with labels rotate by 90 offset character 0,0 title '', \
  '' using ($0+1.5/20):(2.1*$7/1000):(sprintf("%.0f", $7/1000)) with labels rotate by 90 offset character 0,0 title '', \
  '' using ($0+5.0/20):(2.1*$8/1000):($8/1000>=1? sprintf("%.1f", $8/1000) : "") with labels rotate by 90 offset character 0,0 title '', \
  '' using ($0+5.0/20):(2.1*$8/1000):($8/1000 <1? sprintf("%.2f", $8/1000) : "") with labels rotate by 90 offset character 0,0.2 title ''
  # '' using 2 title '' ls 1 lw 3 with linespoints axes x1y2, \
  # '' using 4 title '' ls 2 lw 3 with linespoints axes x1y2, \
  # '' using 6 title '' ls 3 lw 3 with linespoints axes x1y2, \
  # '' using 9 title '' ls 4 lw 3 lc 0 with linespoints axes x1y2




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
