class CreateCats < ActiveRecord::Migration[5.1]
  COLOR = ['red',
          'orange',
          'yellow',
          'white',
          'black',
          'brown',
          'grey'
        ]

  def change
    create_table :cats do |t|
      t.date :birth_date, null: false
      t.string :color, inclusion: COLOR, null: false
      t.string :name, null: false
      t.string :sex, limit: 1, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
