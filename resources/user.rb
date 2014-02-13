actions :create, :delete
default_action :create

attribute :name,
          :name_attribute => true,
          :kind_of => String,
          :required => true

attribute :host,
          :kind_of => String,
          :required => false,
          :default => '%'

attribute :password,
          :kind_of => String,
          :required => false,
          :default => ''

attribute :privileges,
          :kind_of => Array,
          :required => false,
          :default => []
