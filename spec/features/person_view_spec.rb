require 'rails_helper'

describe 'the person view', type: :feature do

  describe 'phone_numbers' do
    let(:person) { Person.create(first_name: 'John', last_name: 'Doe') }

    before(:each) do
      person.phone_numbers.create(number: "555-1234")
      person.phone_numbers.create(number: "555-5678")
      visit person_path(person)
    end

    it 'shows the phone numbers' do
      person.phone_numbers.each do |phone|
        expect(page).to have_content(phone.number)
      end
    end

    it 'has a link to add a new phone number' do
      expect(page).to have_link('Add phone number', href: new_phone_number_path(contact_id: person.id, contact_type: "Person"))
    end

    it 'adds a new phone number' do
      page.click_link('Add phone number')
      page.fill_in('Number', with: '555-8888')
      page.click_button('Create Phone number')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('555-8888')
    end

    it 'has links to edit phone numbers' do
      person.phone_numbers.each do |phone|
        expect(page).to have_link('edit', href: edit_phone_number_path(phone))
      end
    end

    it 'edits a phone number' do
      phone = person.phone_numbers.first
      old_number = phone.number

      first(:link, 'edit').click
      page.fill_in('Number', with: '555-9999')
      page.click_button('Update Phone number')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('555-9999')
      expect(page).to_not have_content(old_number)
    end

    it 'has links to delete phone numbers' do
      person.phone_numbers.each do |phone|
        expect(page).to have_link('delete', href: phone_number_path(phone))
      end
    end

    it 'delete a phone number' do
      phone = person.phone_numbers.first
      old_number = phone.number

      first(:link, 'delete').click
      expect(current_path).to eq(person_path(person))
      expect(page).to_not have_content(old_number)
    end
  end

  describe 'email_addresses' do
    let(:person) { Person.create(first_name: 'John', last_name: 'Doe') }

    before(:each) do
      person.email_addresses.create(address: "john@example.com")
      person.email_addresses.create(address: "john_doe@example.com")
      visit person_path(person)
    end

    it 'has a list with email_addresses' do
      expect(page).to have_selector('li', text: 'john@example.com')
    end

    it 'has a link to add a new email address' do
      expect(page).to have_link('Add email address', href: new_email_address_path(contact_id: person.id, contact_type: "Person"))
    end

    it 'adds a new email address' do
      page.click_link('Add email address')
      page.fill_in('Address', with: 'email@example.com')
      page.click_button('Create Email')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('email@example.com')
    end

    it 'has links to edit an email' do
      person.email_addresses.each do |email|
        expect(page).to have_link('edit', href: edit_email_address_path(email))
      end
    end

    it 'edits an email' do
      email = person.email_addresses.first
      old_email = email.address

      first(:link, 'edit').click
      page.fill_in('Address', with: 'x@example.com')
      page.click_button('Update Email')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('x@example.com')
      expect(page).to_not have_content(old_email)
    end

    it 'has links to delete email' do
      person.email_addresses.each do |email|
        expect(page).to have_link('delete', href: email_address_path(email))
      end
    end

    it 'delete an email' do
      email = person.email_addresses.first
      old_email = email.address

      first(:link, 'delete').click
      expect(current_path).to eq(person_path(person))
      expect(page).to_not have_content(old_email)
    end
  end
end
