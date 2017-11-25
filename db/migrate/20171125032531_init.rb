class Init < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :phone
      t.string :rut

      t.belongs_to :user, index: true

      t.timestamps
    end

    create_table :properties do |t|
      t.string :rut
      t.string :country
      t.string :city
      t.string :address
      t.belongs_to :profile, index: true

      t.timestamps

    end

    create_table :companies do |t|
      t.string :name
      t.string :rut
      t.string :country
      t.string :city
      t.string :address
      t.string :phone

      t.timestamps

    end

    create_table :bill_types do |t|
      t.string :name

      t.timestamps
    end

    create_table :bills do |t|

      t.string :bill_code
      t.datetime :emition_date
      t.datetime :expire_date
      t.boolean :paid
      t.integer :total

      t.belongs_to :profile, index: true
      t.belongs_to :property, index: true
      t.belongs_to :company, index: true
      t.belongs_to :bill_type

      t.timestamps
    end

    

    create_table :files do |t|
      t.string :name
      t.string :description

      t.belongs_to :bill, index: true

      t.timestamps
    end

  end
end
