package "httpd" do
    action :install
   end
   service "httpd" do
    action [:enable, :start]
   end
   
   template '/var/www/html/index.html' do 
    source 'index.html'
    sensitive true
   end    
   
   package 'openssl' do
    action :install
   end
   
   package 'mod_ssl' do
    action :install
   end
   
   cookbook_file '/etc/pki/tls/certs/ca.csr' do
    source 'ca.csr'
    owner 'root'
    group 'root'
    mode '0600'
    action :create
   end
   
   cookbook_file '/etc/pki/tls/certs/ca.key' do
    source 'ca.key'
    owner 'root'
    group 'root'
    mode '0600'
    action :create
   end
   
   service "httpd" do
    action [:enable, :restart]
   end