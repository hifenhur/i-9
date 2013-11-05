# == Schema Information
#
# Table name: documents
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  file       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Document < ActiveRecord::Base
   mount_uploader :file, DocumentUploader
   belongs_to :survey

   def self.import(file)
	  allowed_attributes = ["name", "file"]
	  spreadsheet = open_spreadsheet(file)
	  header = spreadsheet.row(1)
	  (2..spreadsheet.last_row).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    product = find_by_id(row["id"]) || new
	    product.attributes = row.to_hash.select{|k,v| allowed_attributes.include? k}
	    product.save!
	  end
	end

	def self.open_spreadsheet(file)
	  file = Rails.root.to_s+'/public'+ file
	  case File.extname(file)
	  when ".csv" then Roo::Csv.new(file, nil, :ignore)
	  when ".xls" then Roo::Excel.new(file, nil, :ignore)
	  when ".xlsx" then Roo::Excelx.new(file, nil, :ignore)
	  else raise "Unknown file type: #{file.original_filename}"
	  end
	end
	
	def to_s
		self.name
	end
end
