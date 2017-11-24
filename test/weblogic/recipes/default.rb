execute 'groupadd' do
command '/sbin/groupadd oinstall -g 4321' 
end

execute 'useradd' do
command '/sbin/useradd -g oinstall -u 4321 oracle'
end 


directory '/u01' do
  owner 'oracle'
  group 'oinstall'
  recursive true
  action :create
  mode '0755'
end

directory '/u01/app' do
  owner 'oracle'
  group 'oinstall'
  recursive true
  action :create
  mode '0755'
end

directory '/u01/app/oracle' do
  owner 'oracle'
  group 'oinstall'
  recursive true
  action :create
  mode '0755'
end

directory '/u01/app/oracle/product' do
  owner 'oracle'
  group 'oinstall'
  recursive true
  action :create
  mode '0755'
end

directory '/u01/app/oracle/product/ofm12.1.2' do
  owner 'oracle'
  group 'oinstall'
  recursive true
  action :create
  mode '0755'
end

directory '/u01/app/oracle/config' do
  owner 'oracle'
  group 'oinstall'
  recursive true
  action :create
  mode '0755'
end

directory '/uhttps://www.google.co.in/search?q=how+to+change+the+password+for+existing+user+in+linux+with+chef&ie=utf-8&oe=utf-8&gws_rd=cr&dcr=0&ei=VwQLWsijNMb18QXXxpSYBw01/app/oracle/config/domains' do
  owner 'oracle'
  group 'oinstall'
  recursive true
  action :create
  mode '0755'
end

directory '/u01/app/oracle/config/applications' do
  owner 'oracle'
  group 'oinstall'
  recursive true
  action :create
  mode '0755'
end


file '/u01/oraInst.loc' do
   content 'inventory_loc=/u01/app/oraInventory
            inst_group=oinstall'
   mode  '0777'
   owner 'oracle' 
   group 'oinstall'
end

execute 'Installation' do
command '/usr/local/java/bin/java -jar /home/bandaru/Downloads/WLS12.2.1.2/fmw_12.2.1.2.0_wls.jar -silent -responseFile /usr/local/weblogic_silent.rsp -invPtrLoc /u01/oraInst.loc'
  #mode  '0777'
  user 'oracle'
  group 'oinstall'
   timeout 1200
end

