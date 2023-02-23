$chapter = @("a0", "b0", "c0", "d0", "e0", "f0", "g0", "h0", "i0", "j0", "k0", "l0", "m0", "n0", "o0", "p0")
$a = 1
do
{
$chapter += '00'+$a
$a += 1
} until($a -eq 10)
do
{
$chapter += '0'+$a
$a += 1
} until($a -eq 100)
do
{
$chapter += $a
$a += 1
} until($a -eq 372)
foreach($ch in $chapter){
    New-item -itemtype Directory -path C:\filepath-here -name "chapter$ch"
    $req = Invoke-WebRequest -Uri "https://readberserk.com/chapter/berserk-chapter-$ch/"
    $images = $req.Images | Select -ExpandProperty src
    $count = 0
    foreach($img in $images){    
       $wc.DownloadFile($img,"C:\users\cwadu\pictures\Berserk\chapter$ch\pg$count.jpg")
       $count += 1
    }
}