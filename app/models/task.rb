class Task < ApplicationRecord
  include AASM

  scope :newest, -> { order(created_at: :desc) }

  belongs_to :user

  validates :name, presence: true

  aasm column: 'state' do
    state :new, initial: true
    state :started, :finished

    event :start do
      transitions from: :new, to: :started
      transitions from: :finished, to: :started
    end

    event :finish do
      transitions from: :new, to: :finished
      transitions from: :started, to: :finished
    end

    event :begin do
      transitions from: :started, to: :new
      transitions from: :finished, to: :new
    end
  end

  mount_uploader :attachment, AttachmentUploader
end
