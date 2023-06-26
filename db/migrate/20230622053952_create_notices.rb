# frozen_string_literal: true

class CreateNotices < ActiveRecord::Migration[7.0]
  def change
    create_table :notices do |t|
      t.text :notice_title
      t.text :notice_body, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
