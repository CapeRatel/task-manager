module ApplicationHelper
  def attachment_preview(attach)
    if %w(jpg png jpeg).include?(attach.file.extension)
      image_tag(attach, class: 'img-responsive')
    else
      link_to attach.file.filename, attach.url
    end
  end

  def flash_message_class(key)
    klass = case key
            when 'notice' then 'success'
            when 'alert' then 'danger'
            else nil
            end
    klass ? "alert-#{klass}" : ''
  end
end