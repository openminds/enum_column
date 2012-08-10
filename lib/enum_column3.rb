require "enum_column3/version"

module EnumColumn3
  if defined?(::Rails::Railtie)
    class EnumColumnRailtie < Rails::Railtie
      initializer 'enum_column3.initialize', :after => 'active_record.initialize_database' do |app|
        ActiveSupport.on_load :active_record do
          require 'enum_column3/mysql_adapter'
          require 'enum_column3/enum_adapter'
          require 'enum_column3/schema_statements'
          require 'enum_column3/schema_definitions'
          require 'enum_column3/quoting'
          require 'enum_column3/validations'
        end

        ActiveSupport.on_load :action_view do
          require 'enum_column3/active_record_helper'
        end
      end
    end
  end
end
