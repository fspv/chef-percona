action :create do
  # Create user if it is not exists
  execute "mysql-create-user: #{new_resource.name}@#{new_resource.host}" do
    command "mysql -e \"CREATE USER '#{new_resource.name}'@'#{new_resource.host}' IDENTIFIED BY '#{new_resource.password}';\""
    not_if "mysql -e \"SELECT User FROM mysql.user WHERE Host='#{new_resource.host}' AND User='#{new_resource.name}'\\G\" | grep -q '^User: #{new_resource.name}$'"
  end
  # Update user password only if it is defined explicitly
  if new_resource.update_password == true
    execute "mysql-set-password: #{new_resource.name}@#{new_resource.host}" do
      command "mysql -e \"SET PASSWORD FOR '#{new_resource.name}'@'#{new_resource.host}' = PASSWORD('#{new_resource.password}');\""
    end
  end
end

action :delete do
  # Drop mysql user if it is exists
  execute "mysql-drop-user: #{new_resource.name}@#{new_resource.host}" do
    command "mysql -e \"DROP USER '#{new_resource.name}'@'#{new_resource.host}';\""
    only_if "mysql -e \"SELECT User FROM mysql.user WHERE Host='#{new_resource.host}' AND User='#{new_resource.name}'\\G\" | grep -q '^User: #{new_resource.name}$'"
  end
end
