module Lookup
  module Import
    class Subsidiary < ActiveRecord::Base
      validates :fca_number,
        length: { is: 6 },
        numericality: { only_integer: true }

      def self.table_name
        "lookup_import_#{super}"
      end

      def self.fca_import_copy_statement
        "COPY #{table_name} (fca_number, name, created_at, updated_at) FROM stdin;"
      end

      def self.truncate_sql
        "TRUNCATE #{table_name};"
      end

      def self.import_uploaded_fca_data
        lookup_class = Lookup::Subsidiary
        lookup_class.delete_all
        ActiveRecord::Base.connection.execute("INSERT INTO #{lookup_class.table_name} (SELECT * FROM #{table_name});")
      end
    end
  end
end
