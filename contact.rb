class Contact

@@contact_list = []
@@id = 1
  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id +=1
  end

  #getters

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def email
    @email
  end

  def note
    @note
  end

  def id
    @id
  end

  #writers

  def first_name=(first_name)
    @first_name = first_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def email=(email)
    @email = email
  end

  def note=(note)
    @note = note
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
  new_contact = Contact.new(first_name, last_name, email, note)
  @@contact_list << new_contact
  return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contact_list
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(position)
    return Contact.all[position]
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(position,criteria, new_value)
    updatee = Contact.all[position]
    if criteria == "first_name"
      updatee.first_name = new_value
      return updatee
    elsif criteria == "last_name"
      updatee.last_name = new_value
      return updatee
    elsif criteria == "email"
      updatee.email = new_value
      return updatee
    else
        updatee.note = new_value
        return updatee
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(criteria, response)
    if criteria == "first_name"
        Contact.all.each do |contact|
          if contact.first_name == response
            return contact
          end
        end
    elsif criteria == "last_name"
      Contact.all.each do |contact|
        if contact.last_name == response
          return contact
        end
      end
    elsif criteria == "email"
      Contact.all.each do |contact|
        if contact.email == response
          return contact
        end
      end
    elsif criteria =="note"
      Contact.all.each do |contact|
        if contact.note == response
          return contact
        end
      end
    elsif Contact.all.inspect.to_s.include?(response)==false
          return nil
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contact_list.clear
  end

  def full_name
    return "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete(position)
    Contact.all.delete_at(position)
    return nil
  end

  # Feel free to add other methods here, if you need them.

end


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
