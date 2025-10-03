class CreateAllTables < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      # Devise fields
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      # Custom fields
      t.string :name
      t.text :bio
      t.string :avatar

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true

    create_table :games do |t|
      t.string :title, null: false
      t.text :description
      t.date :release_date
      t.string :developer, null: false
      t.string :publisher
      t.string :cover_image
      t.string :genre
      t.string :platform, null: false
      t.decimal :rating, precision: 3, scale: 1

      t.timestamps null: false
    end

    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.integer :rating, null: false
      t.text :content, null: false

      t.timestamps null: false
    end

    create_table :news_articles do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.datetime :published_at
      t.string :image

      t.timestamps null: false
    end

    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :commentable_id, null: false
      t.string :commentable_type, null: false
      t.text :content, null: false

      t.timestamps null: false
    end

    add_index :comments, [:commentable_type, :commentable_id]
    add_index :reviews, [:user_id, :game_id], unique: true
  end
end
