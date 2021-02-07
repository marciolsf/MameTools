$files = Get-Content .\mature.ini


#$rompath = 'C:\bin\mame\roms'


Write-Host "Roms will be removed from the following directory: " $rompath

foreach ($file in $files)
{
    #Write-Host $file".zip" -ForegroundColor Green
    $rom = Get-ChildItem -Path $rompath -Filter $file".zip" -Recurse #-Depth 1
    if ($rom.Exists) {
        Write-Host '###################################################'
        Write-Host 'The following rom was found and will be deleted' 
        Write-Host $rom -ForegroundColor Red
        $rom | Remove-Item #-WhatIf
    }
}