action :create do
  # Create grants if they are not exists already
  execute "#{new_resource.user}@#{new_resource.host}: GRANT #{new_resource.privileges}" do
    command "mysql -e \"GRANT #{new_resource.privileges}  ON #{new_resource.database}.#{new_resource.table} TO '#{new_resource.user}'@'#{new_resource.host}' #{new_resource.with_option};\""
    not_if "mysql -r -B -e \"SHOW GRANTS FOR '#{new_resource.user}'@'#{new_resource.host}'\" | grep -q \"GRANT #{new_resource.privileges} ON #{new_resource.database}.#{new_resource.table} TO '#{new_resource.user}'@'#{new_resource.host}'\""
  end
end

action :delete do
  # Revoke grants if they are exists
  execute "#{new_resource.user}@#{new_resource.host}: REVOKE #{new_resource.privileges}" do
    command 'mysql -e "REVOKE ' + new_resource.privileges + " ON " + new_resource.database + "." + new_resource.table + " FROM '" + new_resource.user + "'@'" + new_resource.host + "';\""
    only_if "mysql -r -B -e \"SHOW GRANTS FOR '#{new_resource.user}'@'#{new_resource.host}'\" | grep -q \"GRANT #{new_resource.privileges} ON #{new_resource.database}.#{new_resource.table} TO '#{new_resource.user}'@'#{new_resource.host}'\""
  end
end
