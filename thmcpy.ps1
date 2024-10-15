#Get-ChildItem *.png | % { magick.exe $_.FullName -define dd:mipmaps=1 -define dds:compression=dtx5 "DDS:$($_.basename).dds" }
#Get-ChildItem *.thm | % { Copy-Item ".\wm_blood_1.thm" $_.FullName }

$wms_path = ".\gamedata\textures\wm\unreal"
$src = $(Join-Path -Path $wms_path -Child "wm_blood_1.thm")

$exclude = "wm_blood_pool*"
$textures = Get-ChildItem $(Join-Path -Path $wms_path -Child "*.dds") -Exclude $exclude
Write-Host $textures
foreach ($texture in $textures) {
    $thm = $texture.BaseName + '.thm'
    $dst = Join-Path -Path $texture.DirectoryName -Child $thm
    Write-Host "$($src) >>> $($dst)"
    Copy-Item -Path $src -Destination $dst
}