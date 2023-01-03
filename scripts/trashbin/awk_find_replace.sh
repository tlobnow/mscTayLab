echo -n "Enter Filename: "  
read file  
echo -n "Enter Search String: "  
read searchstr  
echo -n "Enter String to replace with: "  
read replacestr  
cat $file | awk -v var2=$replacestr '{ gsub(/'$searchstr'/,var2); print}' > file.tmp  
rm -rf $file  
mv file.tmp $file
