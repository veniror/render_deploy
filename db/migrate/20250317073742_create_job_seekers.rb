class CreateJobSeekers < ActiveRecord::Migration[7.2]
  def change
    create_table :job_seekers do |t|
      t.string :full_name
      t.string :email
      t.date :date_of_birth
      t.integer :mobile
      t.text :address

      t.timestamps
    end
  end
end
