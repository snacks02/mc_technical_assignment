# frozen_string_literal: true

class CreateEnums < ActiveRecord::Migration[7.2]
  def up
    create_enum :match_performances_role, %w[
      attacker
      defender
      goalkeeper
      midfielder
    ]
  end

  def down
    execute <<~SQL
      DROP TYPE match_performances_role;
    SQL
  end
end
