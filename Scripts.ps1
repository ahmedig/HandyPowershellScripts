function Compress-Folder($folder)
{
    Write-Host -ForegroundColor Green "Compressing folder: '$folder'"

    if (-not (test-path "$env:ProgramFiles\7-Zip\7z.exe")) {throw "$env:ProgramFiles\7-Zip\7z.exe needed"} 
    set-alias sz "$env:ProgramFiles\7-Zip\7z.exe" 
    $Target = "$folder.7zip"
    sz a -mx=9 $Target $folder
    Write-Host -ForegroundColor Green "folder compressed successfully: '$folder.7zip'"    
}

function CreateFolderIfNotExist($folder)
{
    New-Item -Force -ItemType directory -Path $folder
}