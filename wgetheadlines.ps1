$url = "https://text.npr.org/"
$request = Invoke-WebRequest -uri $url
$headlines = $request.Links 

foreach($headline in $headlines){
    if($headline.class -eq "topic-title"){
        $finalheadline = $headline.InnerText
        Write-Output $finalheadline
    }
}
start-sleep -seconds 1000