require 'rails_helper'

describe ApplicationHelper do
  describe '#flash_message_class' do
    it 'return string with bootstrap success class' do
      helper.flash_message_class('notice').should eql('alert-success')
    end

    it 'return string with bootstrap danger class' do
      helper.flash_message_class('alert').should eql('alert-danger')
    end

    it 'return empty string' do
      helper.flash_message_class('').should eql('')
    end
  end
end