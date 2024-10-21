$InputFolder = ".\gamedata\textures\wm\unreal"
$OutputFolder = '.\output-masked'
$Magick = 'C:\Program Files\ImageMagick-7.1.1-Q16\magick.exe'

$nvtt = 'C:/Program Files/NVIDIA Corporation/NVIDIA Texture Tools/nvcompress.exe'
$nvtt_args = "-bc3 -mipfilter kaiser -alpha"

New-Item -Path $OutputFolder -ItemType Directory -Force
$textures = Get-ChildItem $(Join-Path -Path $InputFolder -Child "*.dds") | Resolve-Path -Relative

Foreach($ddsFile in $textures)
{ 
    #New-Item -Path $jpgPath -ItemType Directory -Force
    Write-Host $ddsFile


    $OutputFile = Join-Path -Path $OutputFolder -Child $ddsFile.Name
    $TempFile = Join-Path -Path $OutputFolder -Child "mask.dds"
    $TempFile2 = Join-Path -Path $OutputFolder -Child "output.dds"
    Write-Host $OutputFile
    Write-Host $TempFile
    Write-Host $TempFile2
    

    # magick.exe .\se0wefxp_8K_Albedo.jpg .\se0wefxp_8K_Opacity.jpg -compose CopyOpacity -composite output.dds
    #magick.exe \(.\se0wefxp_8K_Albedo.jpg .\se0wefxp_8K_Opacity.jpg -compose CopyOpacity -composite\)\
    #.\se0wefxp_8K_Roughness.jpg -compose dissolve 50 -composite output.dds

    #magick.exe .\se0wefxp_8K_Albedo.jpg .\se0wefxp_8K_Roughness.jpg -compose dissolve 50 -composite output.dds

    #magick.exe .\se0wefxp_8K_Albedo.jpg .\se0wefxp_8K_Roughness.jpg -alpha on -compose dissolve  -define compose:args=50 -gravity South  -composite output_dissolve_50.dds
    #magick.exe output_dissolve_50.dds .\se0wefxp_8K_Opacity.jpg -compose CopyOpacity -composite output_dissolve_50_mask.dds

    #$temp = "$($Albedo) $($Roughness) -alpha on -compose dissolve -define compose:args=25 temp.dds"
    #$out = "temp.dds $($Opacity) -compose CopyOpacity -composite $($OutputFile)"

#    C:\Program Files\ImageMagick-7.1.1-Q16\magick.exe .\gamedata\textures\wm\unreal\wm_bloodA1.dds -alpha on \( +clone -channel a -fx 0 \) +swap .\output-masked\mask.dds -composite .\output-masked\output.dds
#    C:\Program Files\ImageMagick-7.1.1-Q16\magick.exe .\gamedata\textures\wm\unreal\wm_bloodA1.dds -alpha on `( +clone -channel a -fx 0 `) +swap .\output-masked\mask.dds -composite .\output-masked\output.dds
    $tempArgs = "$($ddsFile) -alpha extract $($TempFile)"
    $outputArgs = "$($ddsFile) $($TempFile) -alpha Off -compose CopyOpacity -composite -depth 8 $($TempFile2)"
    #$outputArgs = "$($ddsFile) -alpha on `( +clone -channel a -fx 0 `) +swap $($TempFile) -composite $($TempFile2)"
    #-compose Dst_In \( mask.png -alpha copy \) main.png -alpha Set PNG32:result.png
    $outputArgs = "-compose Dst_In `( $($TempFile) -alpha copy `) $($ddsFile) -alpha Set $($TempFile2)"
    #$outputArgs = "$($ddsFile) $($TempFile) -compose CopyOpacity -composite $($TempFile2)"
    $nvidiaArgs = "$nvtt_args $TempFile2 $OutputFile"

    Write-Host $Magick $tempArgs
    & $Magick $tempArgs.Split(' ')
    Write-Host $Magick $outputArgs
    & $Magick $outputArgs.Split(' ')
    Write-Host $nvtt $nvidiaArgs
#    & $nvtt $nvidiaArgs.Split(' ')
    #Write-Host $temp
    #Write-Host $out
    exit

}