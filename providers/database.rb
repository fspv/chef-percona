action :create do
  # Create database if it doesn't exist
  execute "mysql -e 'CREATE DATABASE #{new_resource.name} CHARACTER SET = #{new_resource.character_set} COLLATE = #{new_resource.collate};'" do
    not_if "mysqlshow #{new_resource.name}"
  end
  # Set character set if it differs from given
  execute "mysql -e 'ALTER DATABASE #{new_resource.name} CHARACTER SET = #{new_resource.character_set};'" do
    not_if "mysql #{new_resource.name} -e 'SHOW VARIABLES LIKE \"character_set_database\"\\G' | grep -q '^\\ *Value: #{new_resource.character_set}$'"
  end
  # Set collation if it differs from given
  execute "mysql -e 'ALTER DATABASE #{new_resource.name} COLLATE = #{new_resource.collate}';" do
    not_if "mysql #{new_resource.name} -e 'SHOW VARIABLES LIKE \"collation_database\"\\G' | grep -q '^\\ *Value: #{new_resource.collate}$'"
  end
end

action :delete do
  # Drop database if it is exists
  execute "mysql -e 'DROP DATABASE #{new_resource.name}'" do
    only_if "mysqlshow #{new_resource.name}"
  end
end
