class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def self.import_from_excel(file)
    import_results = { total: 0, success: 0, failed: 0, reasons: [] }
    spreadsheet = Roo::Excelx.new(file.path)
    (2..spreadsheet.last_row).each do |i|
      row = spreadsheet.row(i)
      user_data = { first_name: row[0], last_name: row[1], email: row[2] }
      user = new(user_data)
      if user.save
        import_results[:success] += 1
      else
        import_results[:failed] += 1
        import_results[:reasons] << { row: i, errors: user.errors.full_messages }
      end

      import_results[:total] += 1
    end
    import_results
  end
end
