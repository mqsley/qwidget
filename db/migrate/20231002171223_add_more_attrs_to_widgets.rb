class AddMoreAttrsToWidgets < ActiveRecord::Migration[7.0]
  def change
    add_column :widgets, :font_color, :string
  end
end
