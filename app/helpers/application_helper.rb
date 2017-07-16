module ApplicationHelper
  def flash_message_class(key)
    klass = case key
            when 'notice' then 'success'
            when 'alert' then 'danger'
            else ''
            end
    "alert-#{klass}"
  end
end