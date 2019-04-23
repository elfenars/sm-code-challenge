namespace :data do
  desc "Imports data from a csv file"
  task :import, [:file_path, :chunk_size] => :environment do |t, args|
    Building.import_from_file!(args[:file_path], args[:chunk_size].to_i)
  end
end
