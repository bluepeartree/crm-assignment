gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord::Base

  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text
  # This method should initialize the contact's attributes





  def full_name
    return "#{first_name} #{last_name}"
  end


end

Contact.auto_upgrade!

cap = Contact.create("Steve", "Rogers", "cap@teamcap.com", "has a shield")
marvel = Contact.create("Carol", "Danvers", "cdanvers@usaf.gov", "has kree powers")
iron_man = Contact.create("Tony", "Stark", "tonystark@starkcorp.com", "he's iron man")

# puts Contact.all.inspect
# #
#
# # Contact.find
# cap.update
#
# puts Contact.all.inspect
