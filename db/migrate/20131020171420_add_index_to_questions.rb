# -*- encoding : utf-8 -*-
class AddIndexToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :index, :integer
  end
end
