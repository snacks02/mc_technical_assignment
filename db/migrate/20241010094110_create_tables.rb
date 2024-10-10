# frozen_string_literal: true

class CreateTables < ActiveRecord::Migration[7.2]
  def change
    create_table :teams do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_table :players do |t|
      t.references :team, foreign_key: true, null: false
      t.string :name, null: false

      t.timestamps
    end

    create_table :matches do |t|
      t.float :weight, null: false

      t.timestamps
    end

    create_table :match_performances do |t|
      t.enum :role, enum_type: :match_performances_role, null: false
      t.float :rating
      t.integer :goals, default: 0, null: false
      t.integer :passes, default: 0, null: false
      t.integer :saves, default: 0, null: false
      t.references :match, foreign_key: true, null: false
      t.references :player, foreign_key: true, null: false

      t.timestamps
    end
  end
end
