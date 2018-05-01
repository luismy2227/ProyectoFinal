<?php
//include_once('C:\Users\Luis2\OneDrive\Pictures\Saved Pictures\hqdefault (1).jpg');
$srcfile='..\C:\Users\Luis2\OneDrive\Pictures\Saved Pictures\hqdefault (1).jpg';
//require "$srcfile";
$dstfile='uploaded\probando.jpg';
if (!copy($srcfile, $dstfile)) {
    echo "Error al copiar $srcfile...\n";
}else{
echo "Todo Bien";}
?>