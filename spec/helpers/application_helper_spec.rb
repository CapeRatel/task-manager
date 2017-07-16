require 'rails_helper'

describe ApplicationHelper do
  describe '#flash_message_class' do
    it 'return string with bootstrap success class' do
      expect(helper.flash_message_class('notice')).to eq('alert-success')
    end

    it 'return string with bootstrap danger class' do
      expect(helper.flash_message_class('alert')).to eq('alert-danger')
    end

    it 'return empty string' do
      expect(helper.flash_message_class('')).to eq('')
    end
  end
end