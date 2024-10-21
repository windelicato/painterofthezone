#Get-ChildItem *.png | % { magick.exe $_.FullName -define dd:mipmaps=1 -define dds:compression=dtx5 "DDS:$($_.basename).dds" }
$inputdir = "./png/"
$outputdir = "./png/output"
$input_ft = '.png'
$output_ft = '.dds'

$nvtt = 'C:/Program Files/NVIDIA Corporation/NVIDIA Texture Tools/nvcompress.exe'
$nvtt_args = "-bc3 -mipfilter kaiser -alpha"


if (!(Test-Path -PathType container $outputdir)) {
    New-Item -ItemType Directory -Path $outputdir | Out-Null
}

$files = Get-ChildItem $(Join-Path -Path $inputdir -Child '*.png') 
foreach ($file in $files) {
    $outfile = "$(Join-Path -Path $outputdir -Child $file.basename)$($output_ft)"
    $infile = "$(Join-Path -Path $inputdir -Child $file.basename)$($input_ft)"
    $params = "$nvtt_args $infile $outfile"
    Write-Host $nvtt $params
    & $nvtt $params.Split(' ')

}
