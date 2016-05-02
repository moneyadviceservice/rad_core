module Lookup
  module Import
    class Firm < ActiveRecord::Base
      validates :fca_number,
        length: { is: 6 },
        numericality: { only_integer: true }

      def self.table_name
        "lookup_import_#{super}"
      end

      def self.fca_import_copy_statement
        "COPY #{self.table_name} (fca_number, registered_name, created_at, updated_at) FROM stdin;"
      end

      def self.truncate_sql
        "TRUNCATE #{table_name};"
      end
    end
  end
end
