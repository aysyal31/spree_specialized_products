require 'csv'
require 'roo'

class Spree::ImportSkuStoresAuth
  include ActiveModel::Model
  
    attr_accessor :file

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def save
    if imported_sku_stores.map(&:valid?).all?
      imported_sku_stores.each(&:save!)
      true
    else
      imported_sku_stores.each_with_index do |driver, index|
        driver.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_sku_stores
    @imported_sku_stores ||= load_imported_sku_stores
  end

  def load_imported_sku_stores
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      store_auth = Spree::SkuStoresAuth.new
      store_auth.attributes = row.to_hash.slice(*Spree::SkuStoresAuth.accessibles)
      puts(store_auth)
      store_auth
    end
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path, csv_options: {encoding: "iso-8859-1:utf-8"})
    when ".xls" then Roo::Excel.new(file.path, packed: nil , file_warning: :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end