module Lookup
  module Import
    class Firm < ActiveRecord::Base
      has_many :subsidiaries, primary_key: :fca_number, foreign_key: :fca_number

      validates :fca_number,
        length: { is: 6 },
        numericality: { only_integer: true }

      def self.table_name
        "lookup_import_#{super}"
      end
    end
  end
end
