class Building < ApplicationRecord

  # Faster bulk method. Dupes allowed.
  def self.import_from_file!(file_path, chunk_size)
    i= 1
    Rails.logger.info("Started Import! [FILE: #{file_path}] [BATCH SIZE: #{chunk_size}]")
    SmarterCSV.process(file_path, chunk_size: chunk_size, update_duplicates: true) do |chunk|
      Building.bulk_insert(values: chunk, set_size: chunk_size )
      Rails.logger.info("-- Finished Batch #{i} \t[OID: #{chunk.first[:objectid]}-#{chunk.last[:objectid]}]")
      i += 1
    end
  end

  # Slower single insert, no dupes.
  def self.slow_import_from_file!(file_path)
    CSV.foreach(file_path, headers: true) do |row|
      where(objectid: row["OBJECTID"]).first_or_create do |building|
        building.objectid   = row["OBJECTID"]
        building.adressid   = row["ADRESSID"]
        building.hnr        = row["HNR"]
        building.hnr_zusatz = row["HNR_ZUSATZ"]
        building.str_name   = row["STR_NAME"]
        building.str_nr     = row["STR_NR"]
        building.plz        = row["PLZ"]
        building.bez_name   = row["BEZ_NAME"]
        building.bez_nr     = row["BEZ_NR"]
        building.ort_name   = row["ORT_NAME"]
        building.ort_nr     = row["ORT_NR"]
        building.plr_name   = row["PLR_NAME"]
        building.plr_nr     = row["PLR_NR"]
        building.blk        = row["BLK"]
        building.adr_datum  = row["ADR_DATUM"]
        building.str_datum  = row["STR_DATUM"]
        building.qualitaet  = row["QUALITAET"]
        building.typ        = row["TYP"]
      end
    end
  end
end
