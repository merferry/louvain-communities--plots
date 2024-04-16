set term pdf
set terminal pdf size 10in,2.5in
set output 'louvain-speedup.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set style fill solid border lt -1
set style textbox opaque noborder
set xtics rotate by 30 right
set key above font ",12"
set ylabel  '{/:Bold Speedup}'
set grid y


## Draw plot
plot "louvain-compare.csv" \
     using ($3/$8):xtic(1) title 'Vite (Louvain)'     with histogram fill pattern 3, \
  '' using ($5/$8):xtic(1) title 'Grappolo (Louvain)' with histogram fill pattern 3, \
  '' using ($7/$8):xtic(1) title 'NetworKit Louvain'  with histogram fill pattern 3, \
  '' using ($0-2./10):(8 + $3/$8):(sprintf("%.0f", $3/$8)) with labels rotate by 90 offset character 0,0 title '', \
  '' using ($0-0./10):(8 + $5/$8):($5/$8>=10? sprintf("%.0f", $5/$8) : "") with labels rotate by 90 offset character 0,0 title '', \
  '' using ($0-0./10):(8 + $5/$8):($5/$8 <10? sprintf("%.1f", $5/$8) : "") with labels rotate by 90 offset character 0,0.2 title '', \
  '' using ($0+2./10):(8 + $7/$8):($7/$8>=10? sprintf("%.0f", $7/$8) : "") with labels rotate by 90 offset character 0,0 title '', \
  '' using ($0+2./10):(8 + $7/$8):($7/$8 <10? sprintf("%.1f", $7/$8) : "") with labels rotate by 90 offset character 0,0.2 title ''
  # '' using ($2/$9) title '' ls 1 lw 3 with linespoints axes x1y2, \
  # '' using ($4/$9) title '' ls 2 lw 3 with linespoints axes x1y2, \
  # '' using ($6/$9) title '' ls 3 lw 3 with linespoints axes x1y2




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
