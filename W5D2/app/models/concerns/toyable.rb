module Toyable
  extend ActiveSupport::Concern

  included do
    validates :name, presence: true

    has_many :toys, as: :toyable
  end

  def receive_toy(name)
    toy = Toy.find_or_create_by(name: name)

    self.toys << toy
  end

end
