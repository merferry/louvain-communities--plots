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
set yrange [0.5:1]
set ylabel '{/:Bold Modularity}'
set ytics 0.1
set grid y


## Draw plot
plot "louvain-compare.csv" \
     using  2:xtic(1) title 'Vite [CPU]'     with histogram fill pattern 3, \
  '' using  4:xtic(1) title 'Grappolo [CPU]' with histogram fill pattern 3, \
  '' using  6:xtic(1) title 'NetworKit Louvain [CPU]'  with histogram fill pattern 3, \
  '' using 11:xtic(1) title 'cuGraph Louvain [GPU]'    with histogram fill pattern 3, \
  '' using  9:xtic(1) title 'GVE-Louvain [GPU]'        with histogram fill pattern 3 ls 8, \
  '' using ($0-5.75/20):( $2):(sprintf("%.3f",  $2)) with labels textcolor rgb 'white' rotate by 90 offset character 0,-1.1 title '', \
  '' using ($0-2.75/20):( $4):(sprintf("%.3f",  $4)) with labels textcolor rgb 'white' rotate by 90 offset character 0,-1.1 title '', \
  '' using ($0+0.00/20):( $6):(sprintf("%.3f",  $6)) with labels textcolor rgb 'white' rotate by 90 offset character 0,-1.1 title '', \
  '' using ($0+2.75/20):($11):(sprintf("%.3f", $11)) with labels rotate by 90 offset character 0,-1.1 title '', \
  '' using ($0+5.75/20):( $9):(sprintf("%.3f",  $9)) with labels textcolor rgb 'white' rotate by 90 offset character 0,-1.1 title ''




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
