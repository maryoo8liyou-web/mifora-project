Add-Type -AssemblyName System.Drawing
$assets = (Resolve-Path "assets").Path

# 1) Logo crop from identity-palette.jpg (monogram tile)
$src = [System.Drawing.Bitmap]::FromFile((Join-Path $assets "identity-palette.jpg"))
$logo = New-Object System.Drawing.Bitmap(430, 232)
$g = [System.Drawing.Graphics]::FromImage($logo)
$destRect = [System.Drawing.Rectangle]::new(0, 0, 430, 232)
$srcRect = [System.Drawing.Rectangle]::new(445, 2, 430, 232)
$g.DrawImage($src, $destRect, $srcRect, [System.Drawing.GraphicsUnit]::Pixel)
$g.Dispose()
$logo.Save((Join-Path $assets "logo.png"), [System.Drawing.Imaging.ImageFormat]::Png)
$logo.Dispose()
$src.Dispose()

# 2) Fabric close-up crop from pajamas-hearts.jpg
$src2 = [System.Drawing.Bitmap]::FromFile((Join-Path $assets "pajamas-hearts.jpg"))
$fab = New-Object System.Drawing.Bitmap(500, 500)
$g2 = [System.Drawing.Graphics]::FromImage($fab)
$destRect2 = [System.Drawing.Rectangle]::new(0, 0, 500, 500)
$srcRect2 = [System.Drawing.Rectangle]::new(170, 690, 500, 500)
$g2.DrawImage($src2, $destRect2, $srcRect2, [System.Drawing.GraphicsUnit]::Pixel)
$g2.Dispose()
$fab.Save((Join-Path $assets "pajamas-hearts-fabric.jpg"), [System.Drawing.Imaging.ImageFormat]::Jpeg)
$fab.Dispose()
$src2.Dispose()

Write-Output "crops done"
