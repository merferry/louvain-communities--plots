set term pdf
set terminal pdf size 7.5in,2.5in
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
     using ( $3/1000):xtic(1) title 'Vite [CPU]'     with histogram fill pattern 3, \
  '' using ( $5/1000):xtic(1) title 'Grappolo [CPU]' with histogram fill pattern 3, \
  '' using ( $7/1000):xtic(1) title 'NetworKit Louvain [CPU]'  with histogram fill pattern 3, \
  '' using ($10/1000):xtic(1) title 'cuGraph Louvain [GPU]'    with histogram fill pattern 3, \
  '' using ( $8/1000):xtic(1) title 'GVE-Louvain [CPU]'        with histogram fill pattern 3 ls 8, \
  '' using ($0-5.75/20):(2.3 *  $3/1000):(sprintf("%.0f",  $3/1000)) with labels rotate by 90 offset character 0,0 title '', \
  '' using ($0-2.75/20):(2.3 *  $5/1000):(sprintf("%.0f",  $5/1000)) with labels rotate by 90 offset character 0,0 title '', \
  '' using ($0+0.00/20):(2.3 *  $7/1000):(sprintf("%.0f",  $7/1000)) with labels rotate by 90 offset character 0,0 title '', \
  '' using ($0+2.75/20):(2.3 * $10/1000):(sprintf("%.1f", $10/1000)) with labels rotate by 90 offset character 0,0 title '', \
  '' using ($0+5.75/20):(2.3 *  $8/1000):($8/1000>=1? sprintf("%.1f", $8/1000) : "") with labels rotate by 90 offset character 0,0 title '', \
  '' using ($0+5.75/20):(2.3 *  $8/1000):($8/1000 <1? sprintf("%.2f", $8/1000) : "") with labels rotate by 90 offset character 0,0.2 title ''




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
