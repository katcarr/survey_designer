class CreateResponses < ActiveRecord::Migration
  def change
    create_table(:responses) do |t|
      t.column(:description, :string)
      t.column(:question_id, :integer)

      t.timestamp
    end
  end
end
