class ChangeEmailAddressesToContacts < ActiveRecord::Migration[5.0]
  def up
    EmailAddress.destroy_all
    remove_column :email_addresses, :person_id
    add_column :email_addresses, :contact_id, :integer
    add_column :email_addresses, :contact_type, :string
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
