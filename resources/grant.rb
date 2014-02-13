actions :create, :delete
default_action :create

attribute :privileges,
          :kind_of => Array,
          :required => false,
          :default => 'ALL PRIVILEGES'

attribute :database,
          :kind_of => String,
          :required => true

attribute :table,
          :kind_of => String,
          :required => false,
          :default => '*'

attribute :user,
          :kind_of => String,
          :required => true

attribute :host,
          :kind_of => String,
          :required => true

attribute :with_option,
          :kind_of => String,
          :required => false,
          :default => ''
