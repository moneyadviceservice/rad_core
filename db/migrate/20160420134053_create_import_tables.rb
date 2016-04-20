class CreateImportTables < ActiveRecord::Migration
  def change
    create_table :lookup_import_firms do |t|
      t.integer :fca_number, null: false
      t.string  :registered_name, null: false, default: ''
      t.index   :fca_number, unique: true

      t.timestamps null: false
    end

    create_table :lookup_import_subsidiaries do |t|
      t.integer :fca_number, null: false, index: true
      t.string  :name, null: false, default: ''

      t.timestamps null: false
    end

    create_table :lookup_import_advisers do |t|
      t.string :reference_number, null: false, unique: true, length: 8
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
