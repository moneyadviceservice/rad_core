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

      def self.truncate_sql
        "TRUNCATE #{table_name};"
      end

      def self.import_uploaded_fca_data
        lookup_class = Lookup::Adviser
        lookup_class.delete_all
        ActiveRecord::Base.connection.execute("INSERT INTO #{lookup_class.table_name} (SELECT * FROM #{table_name});")
      end
    end
  end
end
