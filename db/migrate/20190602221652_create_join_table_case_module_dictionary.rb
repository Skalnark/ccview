class CreateJoinTableCaseModuleDictionary < ActiveRecord::Migration[5.2]
  def change
    create_join_table :case_modules, :dictionaries do |t|
      # t.index [:case_module_id, :dictionary_id]
      # t.index [:dictionary_id, :case_module_id]
    end
  end
end
