Hanami::Model.migration do
  change do
    create_table :goals do
      primary_key :id

      column :title,        String,   null: false
      column :description,  String,   null: false,  default: ''
      column :completed_at, DateTime, null: true

      column :created_at,   DateTime, null: false
      column :updated_at,   DateTime, null: false
    end
  end
end
