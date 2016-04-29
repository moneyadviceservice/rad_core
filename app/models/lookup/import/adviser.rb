module Lookup
  module Import
    class Adviser < ActiveRecord::Base
      validates_length_of   :reference_number, is: 8
      validates_presence_of :name

      def self.table_name
        "lookup_import_#{super}"
      end

      def self.fca_import_copy_statement
        "COPY #{table_name} (reference_number, name, created_at, updated_at) FROM stdin;"
      end
    end
  end
end
