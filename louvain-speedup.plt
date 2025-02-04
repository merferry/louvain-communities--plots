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
     using ( $3/$8):xtic(1) title 'Vite [CPU]'     with histogram fill pattern 3, \
  '' using ( $5/$8):xtic(1) title 'Grappolo [CPU]' with histogram fill pattern 3, \
  '' using ( $7/$8):xtic(1) title 'NetworKit Louvain [CPU]'  with histogram fill pattern 3, \
  '' using ($10/$8):xtic(1) title 'cuGraph Louvain [GPU]'    with histogram fill pattern 3, \
  '' using ($0-5.0/20):(8 +  $3/$8):(sprintf("%.0f", $3/$8)) with labels rotate by 90 offset character 0,0 title '', \
  '' using ($0-1.5/20):(8 +  $5/$8):( $5/$8>=10? sprintf("%.0f",  $5/$8) : "") with labels rotate by 90 offset character 0,0 title '', \
  '' using ($0-1.5/20):(8 +  $5/$8):( $5/$8 <10? sprintf("%.1f",  $5/$8) : "") with labels rotate by 90 offset character 0,0.2 title '', \
  '' using ($0+1.5/20):(8 +  $7/$8):( $7/$8>=10? sprintf("%.0f",  $7/$8) : "") with labels rotate by 90 offset character 0,0 title '', \
  '' using ($0+1.5/20):(8 +  $7/$8):( $7/$8 <10? sprintf("%.1f",  $7/$8) : "") with labels rotate by 90 offset character 0,0.2 title '', \
  '' using ($0+5.0/20):(8 + $10/$8):($10/$8>=10? sprintf("%.0f", $10/$8) : "") with labels rotate by 90 offset character 0,0 title '', \
  '' using ($0+5.0/20):(8 + $10/$8):($10/$8 <10? sprintf("%.1f", $10/$8) : "") with labels rotate by 90 offset character 0,0.2 title ''




## Columns in CSV file.
# 01. graph
# 02. vite-m
# 03. vite-t
# 04. grappolo-m
# 05. grappolo-t
# 06. networkit-m
# 07. networkit-t
# 08. sahu-t
# 09. sahu-m
# 10. cugraph-t
# 11. cugraph-m
