
$sourcePath = 'C:\bin\mame\roms'
$badRomsPath = 'C:\bin\mame\badroms'


$roms = Get-ChildItem -Path $sourcePath -Filter ffight*.zip

foreach ($file in $roms) {
    Write-Host '##############################################################'

   $result = (mame64.exe $file.BaseName -verifyroms -rompath $sourcePath) | Out-String   
   if ($result -like '*is bad*') {
    write-host $result -ForegroundColor red
    $bad = $file.FullName
    $bad | Move-Item -Destination $badRomsPath -Force

   }
   elseif ($result -like '*matching*'){
    write-host $result -ForegroundColor Yellow
    write-host $file.BaseName -ForegroundColor Yellow    
    Write-Host $file.Exists -ForegroundColor Yellow
   }
   elseif ($result -like '*is good*'){
    write-host $file.BaseName -ForegroundColor Green    
    Write-Host $file.Exists -ForegroundColor Green
    }
    elseif ($result -like '*not found*'){
        Write-Host $result -ForegroundColor -red
    }
    Write-Host '##############################################################'

}