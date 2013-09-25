action :create do
  log "mysql -e \"show grants for #{new_resource.user}@'#{new_resource.host}'\\G\" | grep -q \"Grants for #{new_resource.user}@#{new_resource.host}: GRANT ALL PRIVILEGES ON \\`#{new_resource.database}\\`.#{new_resource.table} TO '#{new_resource.user}'@'#{new_resource.host}'\""
  execute "mysql -e \"GRANT #{new_resource.privileges} ON \\`#{new_resource.database}\\`.#{new_resource.table} TO '#{new_resource.user}'@'#{new_resource.host}' #{new_resource.with_option};\"" do
    not_if "mysql -e \"show grants for #{new_resource.user}@'#{new_resource.host}'\\G\" | grep -q \"Grants for #{new_resource.user}@#{new_resource.host}: GRANT ALL PRIVILEGES ON .#{new_resource.database}..#{new_resource.table} TO '#{new_resource.user}'@'#{new_resource.host}'\""
  end
end

action :delete do
  log "mysql -e \"show grants for #{new_resource.user}@'#{new_resource.host}'\\G\" | grep -q \"Grants for #{new_resource.user}@#{new_resource.host}: GRANT ALL PRIVILEGES ON \\`#{new_resource.database}\\`.#{new_resource.table} TO '#{new_resource.user}'@'#{new_resource.host}'\""
  execute "mysql -e \"REVOKE #{new_resource.privileges} ON \\`#{new_resource.database}\\`.#{new_resource.table} FROM '#{new_resource.user}'@'#{new_resource.host}';\"" do
    only_if "mysql -e \"show grants for #{new_resource.user}@'#{new_resource.host}'\\G\" | grep -q \"Grants for #{new_resource.user}@#{new_resource.host}: GRANT ALL PRIVILEGES ON .#{new_resource.database}..#{new_resource.table} TO '#{new_resource.user}'@'#{new_resource.host}'\""
  end
end
