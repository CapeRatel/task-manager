module TaskStateable
  extend ActiveSupport::Concern

  def change_state
    load_and_authorize_task
    state = params[:event].to_sym
    if @task.aasm.events(permitted: true).map(&:name).include?(state)
      case state
      when :start then @task.start!
      when :finish then @task.finish!
      when :begin then @task.begin!
      end
    end
    redirect_back(fallback_location: root_path)
  end
end