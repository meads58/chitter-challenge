class Peep

  include DataMapper::Resource

  property :id, Serial
  property :peep, Text
  property :reply_to, Text
  property :entry_time, Time

  belongs_to :user

end