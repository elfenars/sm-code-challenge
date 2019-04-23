class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.integer  :objectid
      t.integer  :adressid
      t.integer  :hnr
      t.string   :hnr_zusatz
      t.string   :str_name
      t.integer  :str_nr
      t.integer  :plz
      t.string   :bez_name
      t.integer  :bez_nr
      t.string   :ort_name
      t.integer  :ort_nr
      t.string   :plr_name
      t.integer  :plr_nr
      t.integer  :blk
      t.datetime :adr_datum
      t.datetime :str_datum
      t.string   :qualitaet
      t.string   :typ

      t.timestamps
    end
  end
end
