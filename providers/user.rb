action :create do
  log "mysql -e \"SELECT User FROM mysql.user WHERE Host='#{new_resource.host}' AND User='#{new_resource.name}'\\G\" | grep -q '^User: #{new_resource.name}$'"
  execute "mysql -e \"CREATE USER '#{new_resource.name}'@'#{new_resource.host}' IDENTIFIED BY '#{new_resource.password}';\"" do
    not_if "mysql -e \"SELECT User FROM mysql.user WHERE Host='#{new_resource.host}' AND User='#{new_resource.name}'\\G\" | grep -q '^User: #{new_resource.name}$'"
  end
  execute "mysql -e \"SET PASSWORD FOR '#{new_resource.name}'@'#{new_resource.host}' = PASSWORD('#{new_resource.password}');\""
end

action :delete do
  execute "mysql -e \"DROP USER '#{new_resource.name}'@'#{new_resource.host}';\"" do
    only_if "mysql -e \"SELECT User FROM mysql.user WHERE Host='#{new_resource.host}' AND User='#{new_resource.name}'\\G\" | grep -q '^User: #{new_resource.name}$'"
  end
end
