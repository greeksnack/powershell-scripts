$image = [System.Drawing.Image]::FromFile("C:filepath_here")
$width = 100
$height = $width / $image.Width * $image.Height
$bitmap = New-Object System.Drawing.Bitmap -ArgumentList ([int]$width), ([int]$height)
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$graphics.DrawImage($image, 0, 0, $width, $height)
$asciiArt = ""
$charSet = " .:-=+*#%@"
for ($y = 0; $y -lt $height; $y++) {
    for ($x = 0; $x -lt $width; $x++) {
        $color = $bitmap.GetPixel($x, $y)
        $brightness = ([int]$color.R + [int]$color.B) / 3
        $charIndex=[math]::Round(($brightness / 255) * ($charSet.Length - 1))       
        $char = $charSet[$charIndex]
        $asciiArt += $char
    }
    $asciiArt += "`n"
}
Write-Output $asciiArt
