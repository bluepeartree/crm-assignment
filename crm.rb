require_relative 'contact'

class CRM

  def initialize

  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then exit(true)
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    puts "Please provide the id of the contact you would like to update:"
    response = gets.to_i
    position = response-1
    if response <1 || response> Contact.all.length
      puts "invalid id."
    else
      user = Contact.find(position)
    end
    puts "Updating #{user.first_name}'s contact."
    puts "Please enter the attribute you would like to update"
    puts "first_name / last_name / email / note"
    criteria = gets.chomp
    if ["first_name", "last_name", "email", "note"].include?(criteria)==false
      puts "That is not a valid criteria to search by!"
    else
      puts "Please provide the new #{criteria}"
      new_value = gets.chomp
      result = user.update(position, criteria, new_value)
      puts user.id
      puts user.full_name
      puts user.email
      puts user.note
    end
  end

  def delete_contact
    puts "Please provide the id of the contact you would like to delete:"
    response = gets.to_i
    Contact.all[0].delete(response-1)
    puts "Contact deleted!"
  end

  def display_all_contacts
    Contact.all.each do |contact|
      puts contact.id
      puts contact.full_name
      puts contact.email
      puts contact.note
    end
  end

  def search_by_attribute
    puts "Please enter the attribute you would like to search by"
    puts "first_name / last_name / email / note"
    criteria = gets.chomp
    if ["first_name", "last_name", "email", "note"].include?(criteria)==false
      puts "That is not a valid criteria to search by!"
    else
      puts "Please provide the #{criteria} of the contact you would like to retrieve:"
      response = gets.chomp
      result = Contact.find_by(criteria, response)
      if result == nil
        puts "#{criteria} #{response} not found. "
      else
        puts result.id
        puts result.full_name
        puts result.email
        puts result.note
      end
    end
  end


end

a_crm_app = CRM.new
a_crm_app.main_menu
