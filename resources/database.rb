actions :create, :delete
default_action :create

attribute :name,
          :name_attribute => true,
          :kind_of => String,
          :required => true

attribute :character_set,
          :kind_of => String,
          :required => false,
          :default => node['percona']['database_default_character_set']

attribute :collate,
          :kind_of => String,
          :required => false,
          :default => node['percona']['database_default_collate']
