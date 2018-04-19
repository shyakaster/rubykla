class AddNameToLeads < ActiveRecord::Migration[5.1]
  def change
   add_column :leads, :name, :string
  end
end
