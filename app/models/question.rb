# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: questions
#
#  id                :integer          not null, primary key
#  description       :text
#  survey_id         :integer
#  created_at        :datetime
#  updated_at        :datetime
#  cells             :integer
#  index             :integer
#  survey_version_id :integer
#

class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers
  attr_accessor :hash


  def answers_count
  	@hash = Answer.distinct(:answer).where('question_id = ?', self.id).group(:answer).count

  	@hash.each do |k, v|
		@hash[k] = ((v*100)/@hash.values.sum)
	end

  end

end
