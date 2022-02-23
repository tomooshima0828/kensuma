class News < ApplicationRecord
  validates :title, presence: true, length: { in: 1..100 }
  validates :status, presence: true

  validate :unable_to_be_published
  validate :news_must_be_delivered_before_now

  enum status: {
    draft:     0,  # 下書きの状態 default
    published: 1 # 公開の状態
  }

  private

  def unable_to_be_published
    if !title.present? || !content.present? || !delivered_at.present? && (status == 'published')
      errors.add(:status, '下書き(draft)から公開(published)に変更したい場合は、全ての項目を入力してください。')
    end
  end

  def news_must_be_delivered_before_now
    unless delivered_at <= Time.now
      errors.add(:delivered_at, '配信日は本日よりも前の日時に設定してください。')
    end
  end
end
