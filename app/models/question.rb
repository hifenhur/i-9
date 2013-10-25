# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  description :text
#  survey_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers


  def answers_count
  	Answer.distinct(:answer).where('question_id = ?', self.id).group(:answer).count
  end

end
