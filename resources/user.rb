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
          :required => true

attribute :update_password,
          :kind_of => [ TrueClass, FalseClass ],
          :required => false,
          :default => false
