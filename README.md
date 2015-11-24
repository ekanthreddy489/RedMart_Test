Installation of Chef solo : 

		1. Log on to any Red hat server and run below command.
		   # curl -L https://www.opscode.com/chef/install.sh | bash
		   # chef-solo -v

Post installation process for chef-solo project: 

	mkdir /root/chef-repo/

#Please create knife.rb file for cookbooks path.

	mkdir .chef/ && cd .chef
	echo "cookbook_path [ '/root/chef-repo/cookbooks' ]" > knife.rb

	knife cookbook create file-copy

# Please navigate to the cookbooks which is defined in .chef/knife.rb file

	cd /root/chef-repo/cookbooks/file-copy

# Go to recipes directory.

	cd recipes

	vi default.rb

	# Add below content.

	file "/tmp/redmart.txt" do
	  owner 'root'
	  group 'root'
	  mode 0755
	  content  'This is 1st test file'
	  action :create
	end

# Create a solo.rb for chef-solo to execute.
	cd ../ && vi /root/chef-repo/cookbooks/file-copy/solo.rb

# Add below content.
	file_cache_path "/root/chef-solo"
	cookbook_path "/root/chef-repo/cookbooks"

# Create a web.json file for mentioning run_lists.

	vi /root/chef-repo/cookbooks/file-copy/web.json
	# Add below content.
	{
	  "run_list": "recipe[file-copy]"
	}

Installtion of your project :

chef-solo -c solo.rb -j web.json


verification : 

ls -l /tmp/redmart.txt && cat /tmp/redmart.txt

