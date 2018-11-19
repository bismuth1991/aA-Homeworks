#Table name: houses
  # id          :integer      not null, primary key
  # name        :string       not null
  # house_id    :integer      not null, foreign key
  # created_at  :datetime     not null
  # updated_at  :datetime     not null

class Person < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :house, {
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'House'
  }
end
