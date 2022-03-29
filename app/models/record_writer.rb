class RecordWriter < ApplicationRecord
  belongs_to :record
  belongs_to :writer
end
