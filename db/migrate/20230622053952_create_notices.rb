# frozen_string_literal: true

class CreateNotices < ActiveRecord::Migration[7.0]
  def change
    create_table :notices do |t|
      t.text :notice_body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
