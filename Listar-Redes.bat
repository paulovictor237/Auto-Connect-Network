@Echo Off
Set "i=0"
For /F "Skip=1Delims=" %%A In (
'WMIC NIC  Get NetConnectionID'
) Do For /F "Delims=" %%B In ("%%A") Do Call :Sub %%B
Set NIC[
Timeout -1
Exit/B
:Sub
Set/A i+=1
Set "NIC[%i%]=%*"