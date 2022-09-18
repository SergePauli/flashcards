class Card < ApplicationRecord
  scope :visible, -> { where("lock_to IS NULL or lock_to < ?", Time.current) }
  scope :normal, -> { where("level < 11 and attempts < 10") }
  validates :name, uniqueness: { message: "Данная карточка уже существует" }, presence: { message: "Слово не должно быть пустым" }
  validates :description, presence: { message: "Перевод слова должен присутствовать" }
end
