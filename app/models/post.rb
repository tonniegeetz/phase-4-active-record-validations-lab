class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %i[fiction non_fiction] }

  validate :clickbait

  private

  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
  ]
  def clickbait
    return unless CLICKBAIT_PATTERNS

    errors.add(:title, 'must be clickbait-y')
  end
end
