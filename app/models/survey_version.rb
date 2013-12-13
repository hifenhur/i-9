# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: survey_versions
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  survey_id   :integer
#  description :text
#  file        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class SurveyVersion < ActiveRecord::Base
  belongs_to :survey
  has_many :questions
  has_one :document
  mount_uploader :file, DocumentUploader
  after_save :refresh_survey

 	def refresh_survey 			
			excel_file = Document.open_spreadsheet(self.file.url)
			create_questions(excel_file)
			create_answers(excel_file)
		
	end

	def create_questions(excel_file)
		excel_file.row(1).each_with_index do |row, i|
			if row
				unless i == 0
					@question.cells = @size
					@question.save!
				end
				@size = 1
				
				@question = Question.find_or_create_by(survey_version_id: self.id, description: row.to_str)
				
				@question.index = i.to_i
				@question.save
			else
				@size += 1
			end
		end
		@last_question = self.questions.last
		@last_question.cells = excel_file.row(1).length.to_i - @last_question.index.to_i
		@last_question.save
	end

	def create_answers(excel_file)
		@spreadsheet = excel_file
		@header = []
		@spreadsheet.row(2).each_with_index do |e, i| 
			if e != nil
				@header << e.to_s
			else
				@header << i.to_s
			end
		end
		(3..@spreadsheet.last_row).each do |y|
			#@row = Hash[[@header, @spreadsheet.row(y)].transpose]
			
			@spreadsheet.row(3).each_with_index do |r, i|
				unless @spreadsheet.row(y)[i] == nil
				   @question = Question.where('index <= ? and survey_version_id = ?', i, self.id).order('index').last
				   if @spreadsheet.row(y)[i].to_s.upcase == "X"
				     answer = Answer.create(answer: @header[i])
				   else
				     answer = Answer.create(answer: @spreadsheet.row(y)[i])
				   end
				   answer.question_id = @question.id 
				   answer.save!
				   
				end
			end
			
		end
	end
end
