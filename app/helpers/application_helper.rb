module ApplicationHelper
  def flash_message_class(key)
    klass = case key
            when 'notice' then 'success'
            when 'alert' then 'danger'
            else nil
            end
    klass.present? ? "alert-#{klass}" : ''
  end
end