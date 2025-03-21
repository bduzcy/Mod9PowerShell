# "C:\Users\cvte1\Documents\HR_Employee_list.txt"



Get-Content C:\Users\cvte1\Documents\HR_Employee_list.txt | Select-String -Pattern "Name: " | matches.value.count


(Get-Content C:\Users\cvte1\Documents\HR_Employee_list.txt | Select-String -Pattern "Name: " | foreach {$_.matches.value}).count


(Get-Content C:\Users\cvte1\Documents\HR_Employee_list.txt | Select-String -Pattern "Name: " | foreach {$_.matches.value}).count | Measure-Object





