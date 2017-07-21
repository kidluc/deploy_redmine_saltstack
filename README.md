Deploy Instrucstion
-------------------

This PJ running on Ubuntu 16.04 with salt version 2017.7.0 (Nitrogen) with MySQL 5.6
------------------------------------------------------------------------------------

Running with command:
- salt '<minion_name>' state.sls <folder_in_/srv/salt>.<file_name_in_folder>
- running follow the list of file in init.sls file


If passenger_error appear then please config the path at passenger_path in file nginx.conf follow the path after running this command on minion terminal
- passenger-config --root

Remember to config the server name in redmine.conf to your domain or IP address
