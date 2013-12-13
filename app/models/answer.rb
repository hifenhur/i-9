# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  answer      :string(255)
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Answer < ActiveRecord::Base
  belongs_to :question
end
