<?php

require_once 'db.php';

/*
$alternatif = [
	array('alternatif' => 'Martono'),
	array('alternatif' => 'Siswono'),
	array('alternatif' => 'Jumadi'),
];

$kriteria = [
	array('kriteria' => 'Disiplin'),
	array('kriteria' => 'Tanggung Jawab'),
	array('kriteria' => 'Jujur'),
];
*/

$q="select * from kriteria order by id_kriteria ASC";
$q=mysql_query($q);
while($h=mysql_fetch_array($q)){
	$kriteria[]=array($h['id_kriteria'],$h['kode'],$h['nama']);
}
$q="select * from alternatif order by id_alternatif ASC";
$q=mysql_query($q);
while($h=mysql_fetch_array($q)){
	$alternatif[]=array($h['id_alternatif'],$h['kode'],$h['nama']);
}
$q="select * from data_alternatif order by id ASC";
$q=mysql_query($q);
while($h=mysql_fetch_array($q)){
	$data_alternatif[]=array($h['id_alternatif'],$h['id_kriteria'],$h['value']);
}

echo json_encode($data_alternatif);

for($i=0;$i<count($kriteria);$i++){
	$id_kriteria[]=$kriteria[$i][0];
}

function ahp_get_matrik_kriteria($id_kriteria){
	for($i=0;$i<count($id_kriteria);$i++){
		for($ii=0;$ii<count($id_kriteria);$ii++){
			if($i==$ii){
				$matrik[$i][$ii]=1;
			}else{
				if($i < $ii){
					$q=mysql_query("select nilai from nilai_kriteria where id_kriteria_1='".$id_kriteria[$i]."' and id_kriteria_2='".$id_kriteria[$ii]."'");
					if(mysql_num_rows($q)>0){
						$h=mysql_fetch_array($q);
						$nilai=$h['nilai'];
						$matrik[$i][$ii]=$nilai;
						$matrik[$ii][$i]=round((1/$nilai),3);
					}else{
						$matrik[$i][$ii]=1;
						$matrik[$ii][$i]=1;
					}
				}
			}
		}
	}
	return $matrik;
}

function get_jumlah_kolom($id_kriteria, $jumlah_kolom = array()){
	for($x=0;$x<count($kriteria);$x++){
	$awd[] = array_sum($jumlah_kolom[$x]);
}
}

$test = ahp_get_matrik_kriteria($id_kriteria);

//$jumlah_kolom = array();
$hasil = 0;
echo "<table border=1>";
echo "<tr>";
echo "<th>Nilai Perbandingan</th>";
echo "</tr>";
echo "<tr>";
echo "<td>Kriteria</td>";
for($x=0;$x<count($kriteria);$x++){
	echo "<td>" . $kriteria[$x][1] ." - ". $kriteria[$x][2] . "</td>";
}
for($x=0;$x<count($kriteria);$x++){
	echo "<tr>";
	echo "<td>" . $kriteria[$x][1] ." - ". $kriteria[$x][2] . "</td>";
	for($y=0;$y<count($kriteria);$y++){
		echo "<td>" . $test[$x][$y] . "</td>";
		$jumlah_kolom[$y][$x] = $test[$x][$y];
	}
	echo "</tr>";
}

for($x=0;$x<count($kriteria);$x++){
	$awd[] = array_sum($jumlah_kolom[$x]);
}
echo "<tr>";
echo "<td>Jumlah Kolom</td>";
for($x=0;$x<count($kriteria);$x++){
echo "<td>" . $awd[$x] . "</td>";
}
echo "</tr>";
echo "</table>";


for($x=0;$x<count($kriteria);$x++){
	for($y=0;$y<count($kriteria);$y++){
		$test2[$x][$y] = round($test[$x][$y] / $awd[$y],3);
	}
}
echo "<br/>";
echo "<table border=1>";
echo "<tr>";
echo "<th>Normalisasi Matriks</th>";
echo "</tr>";
echo "<tr>";
echo "<td>Kriteria</td>";
for($x=0;$x<count($kriteria);$x++){
	echo "<td>" . $kriteria[$x][1] ." - ". $kriteria[$x][2] . "</td>";
}
echo "<td>Jumlah Baris</td>";
echo "<td>Eigen Vektor</td>";
echo "</tr>";
for($x=0;$x<count($kriteria);$x++){
	echo "<tr>";
	echo "<td>" . $kriteria[$x][1] ." - ". $kriteria[$x][2] . "</td>";
	for($y=0;$y<count($kriteria);$y++){
		echo "<td>" . $test2[$x][$y] . "</td>";
		$jumlah_koloms[$y][$x] = $test2[$x][$y];
	}
	$jumlah_baris[] = array_sum($test2[$x]);
	echo "<td>" . array_sum($test2[$x]) . "</td>";
	$eigen[] = array_sum($test2[$x])/count($kriteria);
	echo "<td>" . array_sum($test2[$x])/count($kriteria) . "</td>";
	echo "</tr>";
}
/*
for($x=0;$x<count($kriteria);$x++){
	$awds[] = array_sum($jumlah_koloms[$x]);
}
echo "<tr>";
echo "<td>Jumlah Kolom</td>";
for($x=0;$x<count($kriteria);$x++){
echo "<td>" . $awds[$x] . "</td>";
}
echo "</tr>";
*/
echo "</table>";

function ahp_get_per_kriteria($id_data_alternatif, $data_alternatif){
	for($x=0;$x<count($id_data_alternatif);$x++){
		for($y=0;$y<count($id_data_alternatif);$y++){
			$matrikss[$x][$y] = round($data_alternatif[$x][2]/$data_alternatif[$y][2],3);
		}
	}
	return $matrikss;
}

$test3 = ahp_get_per_kriteria($alternatif, $data_alternatif);

echo "<br/>";
echo "<table border=1>";
echo "<tr><th>Shooting</th>";
echo "</tr>";
echo "<tr>";
echo "<td>Alternatif</td>";
for ($i=0; $i < count($alternatif); $i++) { 
	echo "<td>". $alternatif[$i][2] . "</td>";
}
echo "</tr>";
for ($i=0; $i < count($alternatif); $i++) { 
	echo "<tr>";
	echo "<td>". $alternatif[$i][2] . "</td>";
	for ($ii=0; $ii < count($alternatif); $ii++) { 
		echo "<td>". $test3[$i][$ii] . "</td>";
	}
	echo "</tr>";
}
echo "</table>";
?>