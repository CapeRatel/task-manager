require 'rails_helper'

describe ApplicationHelper do
  describe '#attachment_preview' do
    it 'return empty string' do
      task = create(:task)
      expect(attachment_preview(task.attachment)).to eq('')
    end

    it 'return image_tag helper' do
      task = create(:task, attachment: File.open('spec/fixtures/files/image.jpg'))
      expect(attachment_preview(task.attachment)).to eq(image_tag(task.attachment, class: 'img-responsive'))
    end

    it 'return link_to doc' do
      task = create(:task, attachment: File.open('spec/fixtures/files/text.docx'))
      expect(attachment_preview(task.attachment)).to eq(link_to task.attachment.filename, task.attachment.url)
    end
  end

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