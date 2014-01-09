class Task < ActiveRecord::Base
  belongs_to :tool
  has_one :configure
  has_one :result
end
