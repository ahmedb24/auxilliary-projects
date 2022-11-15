# **SHELL SCRIPTING**
In this project we would onboard 20 new Linux users onto a server and create a shell script that reads a csv file that contains the first name of the users to be onboarded.   

# **Step 1 - Create a names.csv file**

>#Create the project folder called Shell   
>`mkdir Shell`   
><br>
>#Move into the Shell folder   
>`cd Shell`   
><br>
>#Create a csv file name names.csv   
>`touch names.csv`   
><br>
>#Open the names.csv file   
>`vim names.csv`

![namse.csv file](../screenshots/auxproject1/names_csv_file.jpg)
*Created a names.csv file*  
<br>

![namse.csv file content](../screenshots/auxproject1/names_csv_file_content.jpg)
*Content of names.csv file*  
<br>

![part script to create user](../screenshots/auxproject1/create_user.jpg)
*Part script to create user*  
<br>

![part script to configure ssh for user](../screenshots/auxproject1/config_ssh.jpg)
*Part script to configure ssh for user*  
<br>

# **Step 2 - Configure current user with the correct public key and private key**
>#Change directory .ssh folder   
>`cd .ssh`   
><br>
>#Create a file for the public key   
>`touch id_rsa.pub`   
><br>
>#Open the file using your favorite editor and paste in the public key   
>`vi id_rsa.pub`   
><br>
>#Create a file for your private key   
>`touch id_rsa`
><br>   
>#Open the file using your favorite editor and paste in the private key.   
>`vi id_rsa`
><br>   

![created public and private keys](../screenshots/auxproject1/keys.jpg)
*Created public and private keys*  
<br>

Test a few of the users randomly, and ensure that you are able to connect to the server using the private key and the public key