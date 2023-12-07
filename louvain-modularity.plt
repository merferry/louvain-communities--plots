set term pdf
set terminal pdf size 10in,2.5in
set output 'louvain-modularity.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set style fill solid border lt -1
set style textbox opaque noborder
set xtics rotate by 30 right
set key above font ",12"
set ylabel '{/:Bold Modularity}'
set ytics 0.1
set grid y


## Draw plot
plot "louvain-compare.csv" \
     using 2:xtic(1) title 'Vite (Louvain)'     with histogram fill pattern 3, \
  '' using 4:xtic(1) title 'Grappolo (Louvain)' with histogram fill pattern 3, \
  '' using 6:xtic(1) title 'NetworKit Louvain'  with histogram fill pattern 3, \
  '' using 9:xtic(1) title 'GVE-Louvain'        with histogram fill pattern 3 ls 8, \
  '' using ($0-5.0/20):($2):(sprintf("%.3f", $2)) with labels textcolor rgb 'white' rotate by 90 offset character 0,-1.1 title '', \
  '' using ($0-1.5/20):($4):(sprintf("%.3f", $4)) with labels rotate by 90 offset character 0,-1.1 title '', \
  '' using ($0+1.5/20):($6):(sprintf("%.3f", $6)) with labels rotate by 90 offset character 0,-1.1 title '', \
  '' using ($0+5.0/20):($9):(sprintf("%.3f", $9)) with labels textcolor rgb 'white' rotate by 90 offset character 0,-1.1 title ''
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
