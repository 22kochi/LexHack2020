### SET FOLDER TO WATCH + FILES TO WATCH + SUBFOLDERS YES/NO
    $watcher = New-Object System.IO.FileSystemWatcher
    $watcher.Path = "C:\LexHack\yawcamphotos"
    $watcher.Filter = "*.*"
    $watcher.IncludeSubdirectories = $true
    $watcher.EnableRaisingEvents = $true  

###counter variable
$counter = 1


### DEFINE ACTIONS AFTER AN EVENT IS DETECTED
    $action = { $path = $Event.SourceEventArgs.FullPath
                $changeType = $Event.SourceEventArgs.ChangeType
                $logline = "$(Get-Date), $changeType, $path"

###The message displayed to the monitor
Add-Content -Path 'C:\LexHack\start_sanitize.txt' $counter
Add-Content -Path 'C:\LexHack\start_sanitize.txt'  -Value "ALERT! New item. Start sanitizing!`r`n"

###Increase the counter for each item after an event
$counter = $counter + 1

}    
### DECIDE WHICH EVENTS SHOULD BE WATCHED
    Register-ObjectEvent $watcher "Created" -Action $action
    while ($true) {sleep 5}
