$var = (gci env:*).GetEnumerator() | Sort-Object Name
$out = ""
Foreach ($v in $var) {$out = $out + "`t{0,-28} = {1,-28}`n" -f $v.Name, $v.Value}
 
write-output "dump variables on $env:BUILD_ARTIFACTSTAGINGDIRECTORY\test.md"
$fileName = "$env:BUILD_ARTIFACTSTAGINGDIRECTORY\test.md"
set-content $fileName $out
 
write-output "##vso[task.addattachment type=Distributedtask.Core.Summary;name=Environment Variables;]$fileName"
