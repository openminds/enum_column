# EnumColumn3

## Overview

This gem is an extension to ActiveRecord which enables native support of enumerations in the database schema using the ENUM type in MySQL.
Currently only MySQL is supported.
Tested with Rails 3, for Rails 2 you should check out the enum-column plugin (http://rubyforge.org/projects/enum-column/)
Works with Scaffolding.

Supported adapters:
- mysql
- mysql2
- jdbcmysql (by Nilesh Trivedi)

## Installation

Add this line to your application's Gemfile:

    gem 'enum_column3'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install enum_column3

## Usage

### Migration

When you create your schema, specify the constraint as a limit:

    create_table :enumerations, :force => true do |t|
      t.column :severity, :enum, :limit => [:low, :medium, :high, :critical], :default => :medium
      t.column :color, :enum, :limit => [:red, :blue, :green, :yellow]
      ...
    end

### Model and validations

You can automatically validate the enum column using:

    validates_columns :severity, :color

The rest will be handled for you. All enumerated values will be given as symbols.

    @e = Enumeration.new
    @e.severity = :medium

You can always use the column reflection to get the list of possible values from the database column.

    Enumeration.columns_hash['color'].limit
    or
    @enumeration.column_for_attribute(:color).limit
    
    Will yield: [:red, :blue, :green, :yellow]

### Views

You can use enum_select helper to generate input for enumerated attribute as:

     <%= enum_select(@enumeration, 'severity') %>
     or
     <%= form_for @enumeration do |f| %>
        <%= f.label :severity %>
        <%= f.enum_select :severity %>
     <% end %>

You can supply custom values for the enum values using a has:

     <%= enum_select(@enumeration, 'severity', { :low => 'Low severity', :medium => 'Medium severity'}) %>
     or
     <%= form_for @enumeration do |f| %>
        <%= f.label :severity %>
        <%= f.enum_select :severity, { :low => 'Low severity', :medium => 'Medium severity'} %>
     <% end %>

Note: It is not required to supply all possible values in the hash. If a value has no corresponding custom string, it will use the limit instead.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
